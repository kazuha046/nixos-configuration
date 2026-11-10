{ pkgs, ... }:

let
  docker = "${pkgs.docker}/bin/docker";
  curl = "${pkgs.curl}/bin/curl";
  notify = "${pkgs.systemd}/bin/systemd-notify";
  container = "open-webui";
  port = 8090;

  openWebuiRun = pkgs.writeShellScript "open-webui-run" ''
    set -euo pipefail

    if ${docker} container inspect ${container} >/dev/null 2>&1; then
      if [ "$(${docker} container inspect -f '{{.State.Running}}' ${container})" != "true" ]; then
        ${docker} start ${container} >/dev/null
      fi
    else
      ${docker} run -d \
        --network=host \
        --device=nvidia.com/gpu=all \
        -e PORT=${toString port} \
        --name ${container} \
        -v open-webui:/app/backend/data \
        ghcr.io/open-webui/open-webui:ollama >/dev/null
    fi

    ready=0
    for _ in {1..150}; do
      if ${curl} -fsS -o /dev/null http://127.0.0.1:${toString port}/; then
        ready=1
        break
      fi

      running="$(${docker} container inspect -f '{{.State.Running}}' ${container} 2>/dev/null || echo false)"
      if [ "$running" != "true" ]; then
        echo "open-webui: container exited during startup" >&2
        ${docker} logs --tail 50 ${container} >&2 || true
        exit 1
      fi

      ${pkgs.coreutils}/bin/sleep 2
    done

    if [ "$ready" != "1" ]; then
      echo "open-webui: failed to start on 127.0.0.1:${toString port}" >&2
      exit 1
    fi

    ${notify} --ready

    ${docker} wait ${container} >/dev/null 2>&1 || true
  '';
in
{
  systemd.user.sockets."open-webui-proxy" = {
    Unit = {
      Description = "Open-WebUI Socket Activation";
    };
    Socket = {
      ListenStream = "8089";
      Service = "open-webui-proxy.service";
      Accept = false;
    };
    Install = {
      WantedBy = [ "sockets.target" ];
    };
  };

  systemd.user.services."open-webui-proxy" = {
    Unit = {
      Description = "Open-WebUI Socket Proxy";
      BindsTo = [ "open-webui-on-demand.service" ];
      After = [ "open-webui-on-demand.service" ];
    };
    Service = {
      ExecStart = "${pkgs.systemd}/lib/systemd/systemd-socket-proxyd 127.0.0.1:${toString port}";
    };
  };

  systemd.user.services.open-webui-on-demand = {
    Unit = {
      Description = "Open-WebUI On-Demand Container Service";
      After = [ "network.target" ];
      StartLimitIntervalSec = "0";
    };
    Service = {
      Type = "notify";
      NotifyAccess = "all";
      TimeoutStartSec = "0";
      ExecStart = openWebuiRun;
      ExecStop = "-${docker} stop ${container}";
    };
  };
}

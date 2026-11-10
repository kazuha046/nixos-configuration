{ pkgs, ... }:

let
  penpotDir = "/mnt/storage/Documents/Other/penpot";
  docker = "${pkgs.docker}/bin/docker";
  curl = "${pkgs.curl}/bin/curl";
  notify = "${pkgs.systemd}/bin/systemd-notify";

  penpotRun = pkgs.writeShellScript "penpot-run" ''
    set -euo pipefail
    cd ${penpotDir}

    ${docker} compose -p penpot -f docker-compose.yaml up -d

    ready=0
    for _ in {1..90}; do
      if ${curl} -fsS -o /dev/null http://127.0.0.1:9002/; then
        ready=1
        break
      fi
      ${pkgs.coreutils}/bin/sleep 2
    done

    if [ "$ready" != "1" ]; then
      echo "penpot: frontend failed to start on 127.0.0.1:9002" >&2
      ${docker} compose -p penpot -f docker-compose.yaml logs --tail 50 >&2 || true
      exit 1
    fi

    ${notify} --ready

    ${docker} compose -p penpot -f docker-compose.yaml wait penpot-frontend >/dev/null 2>&1 || true
    ${docker} compose -p penpot -f docker-compose.yaml stop >/dev/null 2>&1 || true
  '';
in
{
  systemd.user.services.penpot-on-demand = {
    Unit = {
      Description = "Penpot Docker Compose On-Demand Service";
      After = [ "network.target" ];
      StartLimitIntervalSec = "0";
    };
    Service = {
      Type = "notify";
      NotifyAccess = "all";
      WorkingDirectory = penpotDir;
      TimeoutStartSec = "0";
      ExecStart = penpotRun;
      ExecStop = "${docker} compose -p penpot -f docker-compose.yaml stop";
    };
  };

  systemd.user.sockets.penpot-on-demand = {
    Unit = {
      Description = "Penpot Socket Activation Proxy";
    };
    Socket = {
      ListenStream = "9001";
      Service = "penpot-proxy.service";
      Accept = false;
    };
    Install = {
      WantedBy = [ "sockets.target" ];
    };
  };

  systemd.user.services."penpot-proxy" = {
    Unit = {
      Description = "Penpot Socket Proxy";
      BindsTo = [ "penpot-on-demand.service" ];
      After = [ "penpot-on-demand.service" ];
    };
    Service = {
      ExecStart = "${pkgs.systemd}/lib/systemd/systemd-socket-proxyd 127.0.0.1:9002";
    };
  };
}

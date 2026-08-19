{
  virtualisation.docker = {
    enable = true;

    autoPrune.enable = true;

    daemon.settings = {
      "registry-mirrors" = [
        "https://dockerproxy.com"
      ];
    };
  };
}

{
  virtualisation.docker = {
    enable = true;
    enableNvidia = true;

    autoPrune.enable = true;

    daemon.settings = {
      "registry-mirrors" = [
        "https://dockerproxy.com"
      ];
    };
  };
}

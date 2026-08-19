{
  networking = {
    networkmanager.enable = true;

    hostName = "laptop";

    firewall = {
      trustedInterfaces = [
        "Meta"
        "tun0"
        "mihomo"
      ];

      allowedTCPPorts = [
        53317
        7897
      ];

      allowedUDPPorts = [
        53317
        7897
      ];

      allowedTCPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];

      allowedUDPPortRanges = [
        {
          from = 1714;
          to = 1764;
        }
      ];

      checkReversePath = false;
    };
  };
}

{
  networking = {
    networkmanager = {
      enable = true;

      unmanaged = [
        "interface-name:docker0"
        "interface-name:veth*"
        "interface-name:br-*"
      ];
    };

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
        13245
      ];

      allowedUDPPorts = [
        53317
        7897
        13245
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

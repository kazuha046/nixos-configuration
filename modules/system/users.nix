{ pkgs, ... }:

{
  users.users.mrkir = {
    isNormalUser = true;

    description = "Kirill";

    extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      "uinput"
      "input"
      "ydotool"
      "adbusers"
      "libvirtd"
    ];

    shell = pkgs.fish;
  };

  programs.fish.enable = true;
}

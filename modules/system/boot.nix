{ pkgs, ... }:

{
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.initrd.systemd.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = false;
    configurationLimit = 5;

    theme = "${pkgs.catppuccin-grub}";
  };

  boot.loader.grub.extraEntries = ''
    menuentry "Windows 11" --class windows {
        insmod part_gpt
        insmod fat

        search --fs-uuid --set=root 564F-7F8D

        chainloader /EFI/Microsoft/Boot/bootmgfw.efi
    }
  '';

  boot.kernelPackages = pkgs.linuxPackages_7_1;

  boot.kernelParams = [
    "quiet"
    "splash"
    "boot.shell_on_fail"
    "loglevel=3"
    "rd.systemd.show_status=false"
    "rd.udev.log_level=3"
    "udev.log_priority=3"
    "nvidia_drm.modeset=1"
    "nvidia_drm.fbdev=1"
  ];

  boot.kernelModules = [
    "tun"
  ];

  boot.initrd.kernelModules = [
    "amdgpu"
  ];

  boot.plymouth = {
    enable = true;

    theme = "mac-style";
    themePackages = [ pkgs.mac-style-plymouth ];
  };
}

{ pkgs, config, ... }:

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

  boot.kernelPackages = pkgs.linuxPackages;

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

  boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];

  programs.obs-studio.enableVirtualCamera = true;

  boot.extraModprobeConfig = ''
    options v4l2loopback devices=1 video_nr=1 card_label="OBS Virtual Camera" exclusive_caps=1
  '';

  boot.kernelModules = [
    "tun"
    "v4l2loopback"
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

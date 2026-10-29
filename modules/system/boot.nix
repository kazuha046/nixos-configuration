{ pkgs, config, ... }:

let
  limineWallpaper =
    pkgs.runCommand "limine-wallpaper.png"
      {
        nativeBuildInputs = [ pkgs.imagemagick ];
      }
      ''
        magick ${../../assets/wallpapers/wallpaper-1080p.png} \
          -resize 1920x1080^ \
          -gravity center \
          -extent 1920x1080 \
          -blur 0x8 \
          -fill '#15121880' \
          -colorize 35 \
          $out
      '';
in
{
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  boot.initrd.systemd.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader = {
    timeout = 3;

    systemd-boot.enable = false;
    grub.enable = false;

    limine = {
      enable = true;
      enableEditor = false;

      maxGenerations = 10;
      resolution = "1920x1080x32";

      style = {
        wallpapers = [ limineWallpaper ];
        wallpaperStyle = "stretched";
        backdrop = "151218";

        interface = {
          resolution = "1920x1080";
          branding = "NixOS  |  Kazuha046";
          brandingColor = "D2BCFD";
          helpColor = "CDC2DB";
          helpColorBright = "D2BCFD";
        };

        graphicalTerminal = {
          foreground = "E7E0E8";
          background = "FF151218";
          brightForeground = "EADDFF";
          brightBackground = "FF1D1B20";

          palette = "151218;FFB4AB;CDC2DB;4F3D74;5F3F9D;D2BCFD;CDC2DB;E7E0E8";
          brightPalette = "49454E;FFDAD6;EADDFF;643B46;7B61B5;EADDFF;D2BCDB;FFFFFF";
        };
      };
    };
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

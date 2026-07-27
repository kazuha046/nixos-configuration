{ config, ... }:

{
  programs.niri.settings.spawn-at-startup = [
    {
      command = [
        "wl-paste"
        "--type"
        "text"
        "--watch"
        "cliphist"
        "store"
      ];
    }
    {
      command = [
        "wl-paste"
        "--type"
        "image"
        "--watch"
        "cliphist"
        "store"
      ];
    }
    { command = [ "noctalia" ]; }
    {
      command = [
        "dbus-update-activation-environment"
        "--systemd"
        "DISPLAY"
        "WAYLAND_DISPLAY"
        "XDG_CURRENT_DESKTOP"
      ];
    }
    {
      command = [
        "sh"
        "-c"
        "sleep 5 && discord --start-minimized"
      ];
    }
    {
      command = [
        "steam"
        "-silent"
      ];
    }
    {
      command = [
        "AyuGram"
        "-startintray"
      ];
    }
    {
      command = [
        "gtk-launch"
        "arch-koala-clash"
      ];
    }
    {
      command = [
        "nautilus"
        "--gapplication-service"
      ];
    }
    {
      command = [
        "sh"
        "-c"
        "sleep 5 && ${config.home.homeDirectory}/Applications/Handy_amd64.AppImage --start-hidden"
      ];
    }
    {
      command = [
        "sh"
        "-c"
        "localsend_app --hidden"
      ];
    }
  ];
}

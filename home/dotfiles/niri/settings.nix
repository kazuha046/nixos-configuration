{ config, ... }:

let
  pointer = config.home.pointerCursor;
in
{
  programs.niri = {
    settings = {
      prefer-no-csd = true;

      recent-windows.enable = false;

      gestures = {
        hot-corners.enable = false;
      };

      hotkey-overlay = {
        skip-at-startup = true;
      };

      input = {
        keyboard = {
          numlock = true;

          repeat-delay = 300;
          repeat-rate = 40;

          xkb = {
            layout = "us,ru";
            options = "caps:none,grp:caps_toggle,compose:ralt";
          };
        };

        warp-mouse-to-focus.enable = true;

        touchpad = {
          click-method = "button-areas";
          dwt = true;
          dwtp = true;
          natural-scroll = true;
          scroll-method = "two-finger";
          tap = true;
          tap-button-map = "left-right-middle";
          middle-emulation = true;
          accel-profile = "adaptive";
        };
      };

      environment = {
        CLUTTER_BACKEND = "wayland";
        GDK_BACKEND = "wayland,x11";
        MOZ_ENABLE_WAYLAND = "1";
        NIXOS_OZONE_WL = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_QPA_PLATFORMTHEME = "xdgdesktopportal";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        SDL_VIDEODRIVER = "wayland";
        GDK_CORE_DEVICE_EVENTS = "1";

        XCURSOR_THEME = pointer.name;
        XCURSOR_SIZE = toString pointer.size;
      };

      outputs = {
        "eDP-1" = {
          scale = 1.0;

          position = {
            x = 0;
            y = 0;
          };
        };
      };

      cursor = {
        size = pointer.size;
        theme = pointer.name;
      };
    };
  };
}

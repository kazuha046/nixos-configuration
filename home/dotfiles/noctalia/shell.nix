{ config, ... }:

{
  programs.noctalia.settings.shell = {
    lang = "en";
    font_family = "TeX Gyre Heros";
    panel_anchor_bar = "default";

    avatar_path = "${config.home.homeDirectory}/Pictures/Avatars/kazuha.jpg";

    time_format = "{:%I:%M %p}";
    date_format = "%A, %d %B";

    corner_radius_scale = 2;

    panel = {
      launcher_placement = "attached";

      open_near_click_control_center = true;
    };

    greeter_sync.auto_sync = true;

    session.actions = [
      {
        action = "logout";
        countdown_seconds = 0;
        enabled = true;
        shortcut = "1";
        variant = "default";
      }
      {
        action = "reboot";
        countdown_seconds = 0;
        enabled = true;
        shortcut = "2";
        variant = "default";
      }
      {
        action = "shutdown";
        countdown_seconds = 0;
        enabled = true;
        shortcut = "3";
        variant = "destructive";
      }
      {
        action = "lock";
        enabled = false;
      }
      {
        action = "lock_and_suspend";
        enabled = false;
      }
    ];

    launcher.providers = {
      session.global = true;
    };

    screenshot = {
      directory = "${config.home.homeDirectory}/Pictures/Screenshots";
    };

    screen_corners.enabled = true;

    screen_time_enabled = true;
    polkit_agent = true;
    niri_overview_type_to_launch_enabled = true;
  };
}

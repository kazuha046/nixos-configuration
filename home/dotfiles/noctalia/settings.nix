{ config, pkgs, ... }:

{
  programs.noctalia = {
    enable = true;

    settings = {
      calendar.enabled = true;

      wallpaper = {
        enabled = true;

        default = {
          path = "${config.home.homeDirectory}/Pictures/Wallpapers/raiden.jpg";
        };
      };

      idle = {
        pre_action_fade_seconds = 0;

        behavior_order = [
          "lock"
          "screen-off"
        ];

        behavior.lock = {
          action = "lock";
          enabled = true;
          timeout = 900;
        };

        behavior.screen-off = {
          action = "screen_off";
          enabled = true;
          timeout = 1800;
        };
      };

      audio = {
        enable_overdrive = true;
        enable_sounds = true;
        sound_volume = 1;
      };

      theme = {
        source = "wallpaper";
        wallpaper_scheme = "m3-tonal-spot";

        templates = {
          enable_builtin_templates = true;
          enable_community_templates = true;

          builtin_ids = [
            "cava"
            "niri"
            "btop"
            "gtk3"
            "gtk4"
            "kcolorscheme"
            "qt"
            "ghostty"
          ];

          community_ids = [
            "discord"
            "vscode"
            "yazi"
            "neovim"
            "spicetify"
            "obs"
            "prismlauncher"
            "opencode"
            "telegram"
            "bat"
            "obsidian"
            "steam"
          ];
        };
      };

      dock = {
        enabled = true;

        active_monitor_only = true;
        show_instance_count = true;
        show_dots = false;

        main_axis_padding = 0;
        cross_axis_padding = 0;
        item_spacing = 0;
        margin_edge = 4;
        radius = 80;
        background_opacity = 0.5;

        pinned = [
          "librewolf"
          "discord"
          "com.ayugram.desktop"
        ];
      };

      control_center = {
        sidebar = "full";
        sidebar_section = "full";
      };

      widget = {
        eyecare-widget = {
          type = "apex077/eyecare:eyecare-widget";
        };

        bluetooth = {
          hide_when_no_connected_device = true;
        };

        active_window = {
          icon_size = 18;
          show_empty_label = true;
          title_scroll = "always";
        };

        clock = {
          format = "{:%I:%M %p}";
          tooltip_format = "{:%A, %d %B}";
        };

        spacer_2.type = "spacer";
        spacer_3.type = "spacer";
        spacer_4.type = "spacer";
        spacer_5.type = "spacer";
        spacer_6.type = "spacer";
        spacer_7.type = "spacer";
        spacer_8.type = "spacer";

        weather = {
          show_condition = false;
        };

        media = {
          art_size = 18;
          hide_when_no_media = true;
          title_scroll = "always";
        };

        workspaces = {
          empty_color = "outline";
          occupied_color = "tertiary";

          labels_only_when_occupied = true;
        };
      };

      location = {
        address = "Kursk, Russia";
      };

      nightlight.enabled = true;

      bar.default = {
        background_opacity = 0.5;
        scale = 1.3;
        margin_ends = 12;
        margin_edge = 12;
        padding = 18;
        thickness = 48;
        radius = 80;

        concave_edge_corners = false;
        hover_highlight = false;

        start = [
          "workspaces"
          "spacer_2"
          "active_window"
          "spacer_3"
          "media"
        ];

        center = [
          "caffeine"
          "clock"
        ];

        end = [
          "audio_visualizer"
          "spacer_7"
          "weather"
          "spacer_6"
          "bluetooth"
          "network"
          "spacer_5"
          "brightness"
          "battery"
          "spacer_4"
          "eyecare-widget"
          "spacer_8"
          "tray"
        ];

        dead_zone.actions = {
          scroll_down = "volume-down";
          scroll_up = "volume-up";
          left = "panel-toggle launcher";
          middle = "exec ${pkgs.ghostty}/bin/ghostty";
          back = "media previous";
          forward = "media next";
        };
      };
    };
  };
}

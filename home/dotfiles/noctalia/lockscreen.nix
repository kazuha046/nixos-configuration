{ config, ... }:

{
  programs.noctalia.settings = {
    lockscreen = {
      blurred_desktop = true;
    };

    lockscreen_widgets = {
      enabled = true;
      schema_version = 2;

      widget_order = [
        "lockscreen-login-box@eDP-1"
        "lockscreen-widget-0000000000000001"
        "lockscreen-widget-0000000000000003"
        "lockscreen-widget-0000000000000004"
        "lockscreen-widget-0000000000000005"
        "lockscreen-widget-0000000000000007"
      ];

      grid = {
        cell_size = 16;
        major_interval = 4;
        visible = true;
      };

      widget = {
        "lockscreen-login-box@eDP-1" = {
          box_height = 196.0;
          box_width = 720.0;
          cx = 960.0;
          cy = 620.0;
          output = "eDP-1";
          rotation = 0.0;
          type = "login_box";

          settings = {
            background_color = "surface_variant";
            background_opacity = 0.5;
            background_radius = 16.0;
            center_password_text = true;
            input_opacity = 0.5;
            input_radius = 16.0;
            layout = "regular";
            show_caps_lock = true;
            show_keyboard_layout = true;
            show_login_button = true;
            show_media = true;
            show_session_buttons = true;
            show_weather = false;
          };
        };

        "lockscreen-widget-0000000000000001" = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 960.0;
          cy = 460.0;
          output = "eDP-1";
          rotation = 0.0;
          type = "clock";

          settings = {
            background = false;
            background_opacity = 0.5;
            background_padding = 16;
            background_radius = 16;
            center_text = true;
            clock_style = "digital";
            color = "primary";
            format = "{:%I:%M %p}";
            shadow = true;
          };
        };

        "lockscreen-widget-0000000000000003" = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 116.0;
          cy = 996.5;
          output = "eDP-1";
          rotation = 0.0;
          type = "sysmon";

          settings = {
            background_opacity = 0.5;
            background_radius = 16;
            display = "graph";
            shadow = true;
            show_label = true;
            stat = "cpu_usage";
            stat2 = "cpu_temp";
          };
        };

        "lockscreen-widget-0000000000000004" = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 116.0;
          cy = 819.5;
          output = "eDP-1";
          rotation = 0.0;
          type = "weather";

          settings = {
            background_opacity = 0.5;
            background_radius = 16;
            color = "primary";
            show_forecast = true;
          };
        };

        "lockscreen-widget-0000000000000005" = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 1784.0;
          cy = 990.0;
          output = "eDP-1";
          rotation = 0.0;
          type = "volume";

          settings = {
            device = "output";
          };
        };

        "lockscreen-widget-0000000000000007" = {
          box_height = 0.0;
          box_width = 0.0;
          cx = 1790.0;
          cy = 788.5;
          output = "eDP-1";
          rotation = 0.0;
          type = "sticker";

          settings = {
            background_opacity = 0.0;
            image_path = "${config.home.homeDirectory}/Pictures/Avatars/kazuha-modified.png";
            opacity = 1.0;
          };
        };
      };
    };
  };
}

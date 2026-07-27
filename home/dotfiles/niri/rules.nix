{
  programs.niri.settings = {
    window-rules = [
      {
        clip-to-geometry = true;
        draw-border-with-background = false;

        geometry-corner-radius =
          let
            radius = 16.0;
          in
          {
            bottom-left = radius;
            bottom-right = radius;
            top-left = radius;
            top-right = radius;
          };

        opacity = 0.95;
      }
      {
        matches = [ { is-floating = true; } ];
        shadow.enable = true;
      }
      {
        matches = [ { app-id = "^steam_app_[0-9]+$"; } ];
        open-fullscreen = true;
      }
      {
        matches = [
          { app-id = "com.mitchellh.ghostty.yazi"; }
        ];

        open-floating = false;
        open-maximized = true;
      }
      {
        matches = [
          {
            app-id = "steam";
            title = "^notificationtoasts_\\d+_desktop$";
          }
        ];

        open-floating = true;
        open-focused = false;

        default-floating-position = {
          relative-to = "bottom-right";

          x = 10;
          y = -70;
        };
      }
      {
        matches = [ { app-id = "io.missioncenter.MissionCenter"; } ];

        open-floating = true;

        default-column-width.fixed = 1200;
        default-window-height.fixed = 800;
      }
      {
        matches = [ { app-id = "com.ayugram.desktop"; } ];
        block-out-from = "screencast";
      }
      {
        matches = [
          { app-id = "librewolf"; }
          { app-id = "Tor Browser"; }
          { app-id = "chromium-browser"; }
          { app-id = "obsidian"; }
          { app-id = "^[Ss]potify$"; }
          { app-id = "org.gnome.Evince"; }
        ];

        open-maximized = true;
      }
      {
        matches = [
          { app-id = "com.ayugram.desktop"; }
          { app-id = "^[Dd]iscord$"; }
          { app-id = "^vesktop$"; }
        ];

        open-on-workspace = "2";
      }
      {
        matches = [
          {
            app-id = "^[Ss]team$";
            title = "^[Ss]team$";
          }
        ];

        open-on-workspace = "3";
      }
      {
        matches = [ { is-window-cast-target = true; } ];

        focus-ring.enable = false;

        border = {
          enable = true;

          active.color = "#f4b7b9";
          inactive.color = "#690005";
        };
      }
      {
        matches = [
          { title = "Picture-in-Picture"; }
        ];

        open-floating = true;

        default-floating-position = {
          x = 32;
          y = 32;

          relative-to = "bottom-right";
        };

        default-column-width.fixed = 480;
        default-window-height.fixed = 270;
      }
      {
        matches = [
          { app-id = "dialog"; }
          { app-id = "popup"; }
          { app-id = "task_dialog"; }
          { app-id = "gcr-prompter"; }
          { app-id = "file-roller"; }
          { app-id = "org.gnome.FileRoller"; }
          { app-id = "nm-connection-editor"; }
          { app-id = "blueman-manager"; }
        ];

        open-floating = true;
      }
      {
        matches = [
          { title = "Progress"; }
          { title = "File Operations"; }
          { title = "Copying"; }
          { title = "Moving"; }
          { title = "Properties"; }
          { title = "file progress"; }
          { title = "Confirm"; }
          { title = "Authentication Required"; }
          { title = "Notice"; }
          { title = "Warning"; }
          { title = "Error"; }
        ];

        open-floating = true;
      }
      {
        matches = [
          {
            app-id = "org.gnome.Nautilus";
            title = "(?i)^.*(File Upload|Choose Files|Open folder|Enter name of file to save to|Open Document).*$";
          }
          { app-id = "xdg-desktop-portal-gtk"; }
        ];

        open-floating = true;

        default-column-width.fixed = 800;
        default-window-height.fixed = 600;
      }
    ];
  };
}

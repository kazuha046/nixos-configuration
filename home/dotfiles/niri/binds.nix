{ config, pkgs, ... }:

{
  programs.niri.settings.binds =
    with config.lib.niri.actions;

    let
      fullscreen-screenshot = spawn "sh" "-c" "noctalia msg screenshot-fullscreen";
      terminal = spawn "${pkgs.ghostty}/bin/ghostty";
    in
    {
      ### Noctalia shell
      # Audio
      "XF86AudioRaiseVolume" = {
        hotkey-overlay.title = "Increase volume";
        action = spawn "sh" "-c" "noctalia msg volume-up";
      };
      "XF86AudioLowerVolume" = {
        hotkey-overlay.title = "Decrease volume";
        action = spawn "sh" "-c" "noctalia msg volume-down";
      };

      "XF86AudioMute" = {
        hotkey-overlay.title = "Mute volume";
        action = spawn "sh" "-c" "noctalia msg volume-mute";
      };

      # Brightness
      "XF86MonBrightnessUp" = {
        hotkey-overlay.title = "Increase brightness";
        action = spawn "sh" "-c" "noctalia msg brightness-up";
      };
      "XF86MonBrightnessDown" = {
        hotkey-overlay.title = "Decrease brightness";
        action = spawn "sh" "-c" "noctalia msg brightness-down";
      };

      # Media
      "XF86AudioPlay" = {
        hotkey-overlay.title = "Play media";
        action = spawn "sh" "-c" "noctalia msg media play";
      };
      "XF86AudioStop" = {
        hotkey-overlay.title = "Stop media";
        action = spawn "sh" "-c" "noctalia msg media stop";
      };

      "XF86AudioPrev" = {
        hotkey-overlay.title = "Previous media";
        action = spawn "sh" "-c" "noctalia msg media previous";
      };
      "XF86AudioNext" = {
        hotkey-overlay.title = "Next media";
        action = spawn "sh" "-c" "noctalia msg media next";
      };

      # Noctalia core
      "Mod+I" = {
        hotkey-overlay.title = "Toggle settings";
        action = spawn "sh" "-c" "noctalia msg settings-toggle";
      };
      "Mod+Space" = {
        hotkey-overlay.title = "Toggle launcher";
        action = spawn "sh" "-c" "noctalia msg panel-toggle launcher";
      };
      "Mod+U" = {
        hotkey-overlay.title = "Toggle control center";
        action = spawn "sh" "-c" "noctalia msg panel-toggle control-center";
      };

      "Mod+Shift+R" = {
        hotkey-overlay.title = "Reload Noctalia";
        action = spawn "sh" "-c" "noctalia msg config-reload";
      };

      # Session
      "Mod+L" = {
        hotkey-overlay.title = "Lock the screen";
        action = spawn "sh" "-c" "noctalia msg session lock";
      };

      "Ctrl+Alt+Delete" = {
        hotkey-overlay.title = "Show session menu";
        action = spawn "sh" "-c" "noctalia msg panel-open session";
      };

      # Noctalia panels
      "Mod+V" = {
        hotkey-overlay.title = "Show clipboard panel";
        action = spawn "sh" "-c" "noctalia msg panel-toggle clipboard";
      };

      "Mod+Shift+D" = {
        hotkey-overlay.title = "Show docker panel";
        action = spawn "sh" "-c" "noctalia msg panel-toggle 8bury/mini-docker:manager";
      };

      "Mod+Shift+M" = {
        hotkey-overlay.title = "Show nix monitor panel";
        action = spawn "sh" "-c" "noctalia msg panel-toggle avivbintangaringga/nix-monitor:panel";
      };

      "Mod+Shift+N" = {
        hotkey-overlay.title = "Show notes panel";
        action = spawn "sh" "-c" "noctalia msg panel-toggle noctalia/notes:panel";
      };

      "Mod+Shift+P" = {
        hotkey-overlay.title = "Show portctl panel";
        action = spawn "sh" "-c" "noctalia msg panel-toggle rxtsel/portctl:panel";
      };

      "Mod+Shift+T" = {
        hotkey-overlay.title = "Show todo panel";
        action = spawn "sh" "-c" "noctalia msg panel-toggle nightwatch75/todo:panel";
      };

      "Mod+Shift+W" = {
        hotkey-overlay.title = "Show video wallpaper panel";
        action = spawn "sh" "-c" "noctalia msg panel-toggle noctalia/mpvpaper:picker";
      };

      "Mod+Shift+F" = {
        hotkey-overlay.title = "Show file search panel";
        action = spawn "sh" "-c" "noctalia msg panel-toggle nightwatch75/file-search:panel";
      };

      "Mod+Shift+G" = {
        hotkey-overlay.title = "Show game panel";
        action = spawn "sh" "-c" "noctalia msg panel-toggle alexander/game-launcher:browser";
      };

      "Mod+Shift+B" = {
        hotkey-overlay.title = "Show next boot panel";
        action = spawn "sh" "-c" "noctalia msg panel-toggle avivbintangaringga/nextboot-selector:panel";
      };

      "Mod+Shift+C" = {
        hotkey-overlay.title = "Show color picker panel";
        action = spawn "sh" "-c" "noctalia msg panel-toggle oldirtty/color_picker:panel";
      };

      # Window management
      "Mod+Tab" = {
        hotkey-overlay.title = "Show window switcher";
        action = spawn "sh" "-c" "noctalia msg window-switcher";
      };

      # Screenshot
      "Mod+Shift+S" = {
        hotkey-overlay.title = "Take area screenshot";
        action = spawn "sh" "-c" "noctalia msg screenshot-region";
      };
      "Print" = {
        hotkey-overlay.title = "Take fullscreen screenshot";
        action = fullscreen-screenshot;
      };
      "Mod+P" = {
        hotkey-overlay.title = "Take fullscreen screenshot";
        action = fullscreen-screenshot;
      };

      ### Apps
      "Ctrl+Shift+F9" = {
        hotkey-overlay.title = "Toggle OBS recording";
        action = spawn "sh" "-c" "obs-cmd recording toggle";
      };

      "Mod+Return" = {
        hotkey-overlay.title = "Open terminal";
        action = terminal;
      };
      "Mod+T" = {
        hotkey-overlay.title = "Open terminal";
        action = terminal;
      };

      "Mod+E" = {
        hotkey-overlay.title = "Open file manager";
        action = spawn "${pkgs.nautilus}/bin/nautilus";
      };
      "Mod+Shift+E" = {
        hotkey-overlay.title = "Open another file manager";
        action = spawn "${pkgs.ghostty}/bin/ghostty" "--class=com.mitchellh.ghostty.yazi" "-e" "yazi";
      };

      "Mod+B" = {
        hotkey-overlay.title = "Open browser";
        action = spawn "${pkgs.librewolf}/bin/librewolf";
      };

      "Mod+C" = {
        hotkey-overlay.title = "Open code editor";
        action = spawn "${pkgs.vscode}/bin/code";
      };

      "Ctrl+Shift+Escape" = {
        hotkey-overlay.title = "Open mission center";
        action = spawn "${pkgs.mission-center}/bin/missioncenter";
      };

      "Mod+Shift+H" = {
        hotkey-overlay.title = "Toggle handy transcription";
        action =
          spawn "sh" "-c"
            "${config.home.homeDirectory}/Applications/Handy_amd64.AppImage --toggle-transcription";
      };

      ### Window management
      # Core window actions
      "Mod+Slash" = {
        hotkey-overlay.title = "Toggle cheatsheet panel";
        action = spawn "sh" "-c" "noctalia msg panel-toggle kenn/keybind-cheatsheet:cheatsheet";
      };

      "Mod+Q".action = close-window;
      "Mod+W".action = toggle-column-tabbed-display;
      "Mod+F".action = toggle-window-floating;
      "Mod+O".action = toggle-overview;
      "Alt+Tab".action = switch-focus-between-floating-and-tiling;
      "Mod+Ctrl+C".action = center-visible-columns;

      # Fullscreen window
      "F11".action = {
        fullscreen-window = { };
      };

      "Mod+Ctrl+F".action = maximize-column;

      # Set column width / height
      "Mod+1".action = set-column-width "25%";
      "Mod+2".action = set-column-width "50%";
      "Mod+3".action = set-column-width "75%";
      "Mod+4".action = set-column-width "100%";

      "Mod+Minus".action = set-column-width "-10%";
      "Mod+Equal".action = set-column-width "+10%";
      "Mod+Shift+Minus".action = set-window-height "-10%";
      "Mod+Shift+Equal".action = set-window-height "+10%";

      # Move window
      "Mod+Ctrl+Up".action = move-window-up;
      "Mod+Ctrl+Down".action = move-window-down;
      "Mod+Ctrl+Left".action = move-column-left;
      "Mod+Ctrl+Right".action = move-column-right;

      "Mod+Ctrl+Alt+Up".action = move-column-to-workspace-up;
      "Mod+Ctrl+Alt+Down".action = move-column-to-workspace-down;

      "Mod+Comma".action = consume-window-into-column;
      "Mod+Period".action = expel-window-from-column;

      "Mod+Shift+Ctrl+Down".action = move-column-to-monitor-down;
      "Mod+Shift+Ctrl+Up".action = move-column-to-monitor-up;
      "Mod+Shift+Ctrl+Left".action = move-column-to-monitor-left;
      "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;

      # Focus window
      "Mod+Left".action = focus-column-left;
      "Mod+Right".action = focus-column-right;
      "Mod+Down".action = focus-window-or-workspace-down;
      "Mod+Up".action = focus-window-or-workspace-up;

      # Focus workspace
      "Mod+Alt+Down".action = focus-workspace-down;
      "Mod+Alt+Up".action = focus-workspace-up;

      "Mod+WheelScrollDown".action = focus-workspace-down;
      "Mod+WheelScrollUp".action = focus-workspace-up;
    };
}

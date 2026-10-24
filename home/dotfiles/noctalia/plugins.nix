{ config, ... }:

{
  programs.noctalia.settings.plugins = {
    enabled = [
      "noctalia/mpvpaper"
      "noctalia/translator"
      "noctalia/kaomoji"
      "noctalia/notes"
      "noctalia/timer"
      "8bury/mini-docker"
      "avivbintangaringga/nix-monitor"
      "avivbintangaringga/nextboot-selector"
      "nightwatch75/todo"
      "nightwatch75/file-search"
      "rxtsel/portctl"
      "radimous/prismlauncher-instances"
      "kenn/keybind-cheatsheet"
      "oldirtty/color_picker"
      "apex077/eyecare"
      "alexander/game-launcher"
      "yocraft/web-launcher"
      "reaperhound/ambient-sounds"
      "hy4ri/github-notifications"
      "alexmnrs/github-activity"
      "andrewdems/printers"
      "marccvictoria/llamanager"
      "icefish/phone-connect"
      "nightwatch75/dns-switcher"
      "thaer99ob/default-apps"
      "tphilippot/git_companion"
      "yocraft/qrcode"
      "nomadcxx/gamer-mode"
      "cleboost/jetbrains-provider"
    ];

    source = [
      {
        name = "official";
        kind = "git";
        location = "https://github.com/noctalia-dev/official-plugins";
      }
      {
        name = "community";
        kind = "git";
        location = "https://github.com/noctalia-dev/community-plugins";
      }
    ];
  };

  programs.noctalia.settings.plugin_settings = {
    "noctalia/mpvpaper" = {
      video_directory = "${config.home.homeDirectory}/Videos/Wallpapers";
    };

    "radimous/prismlauncher-instances" = {
      prism_path = "${config.home.homeDirectory}/.local/share/ElyPrismLauncher";
      launcher_exec_command = "pineconemc";
    };

    "thaer99ob/default-apps" = {
      manager_open_near_click = true;
      manager_placement = "attached";
    };

    "yocraft/qrcode" = {
      panel_open_near_click = true;
      panel_placement = "attached";
    };

    "nomadcxx/gamer-mode" = {
      main_open_near_click = true;
    };

    "marccvictoria/llamanager" = {
      panel_placement = "attached";
    };

    "icefish/phone-connect" = {
      details_floating_open_near_click = true;

      details_floating_placement = "attached";
      details_widget_placement = "attached";
    };

    "kenn/keybind-cheatsheet" = {
      cheatsheet_placement = "attached";
    };

    "8bury/mini-docker" = {
      manager_placement = "attached";
    };

    "reaperhound/ambient-sounds" = {
      main_layer = "overlay";
      main_placement = "attached";
    };

    "avivbintangaringga/nix-monitor" = {
      panel_card_opacity = 50;
      update_command = "nix flake update /etc/nixos";
    };

    "rxtsel/portctl" = {
      panel_placement = "attached";
    };

    "oldirtty/color_picker" = {
      panel_placement = "attached";
    };

    "nightwatch75/file-search" = {
      exclude_dirs = "jetbra,6000.3.12f1,.git,node_modules,target,dist,build,out,.venv,venv,__pycache__,Library,Temp,Logs,.direnv";
    };

    "alexander/game-launcher" = {
      browser_placement = "attached";
      steampoacher_enabled = true;
      browser_open_near_click = true;
      original_open_near_click = true;
      original_placement = "attached";
    };

    "avivbintangaringga/nix-monitor" = {
      branch = "nixos-26.05";
    };

    "yocraft/web-launcher" = {
      links = [
        "GitHub|https://github.com"
        "YouTube|https://youtube.com"
        "Gmail|https://mail.google.com"
      ];
    };
  };
}

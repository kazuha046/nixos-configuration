{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;

    settings = {
      palette = "noctalia";

      add_newline = false;

      command_timeout = 1300;
      scan_timeout = 50;

      format = "$username$hostname$directory$os$git_branch$git_status\n$character";

      directory = {
        truncation_length = 0;
        truncate_to_repo = false;

        style = "bold mauve";
      };

      git_branch = {
        style = "bold lavender";
      };

      character = {
        success_symbol = "[❯](bold green)";
        error_symbol = "[❯](bold red)";
      };

      os = {
        disabled = false;

        symbols = {
          NixOS = " ";
        };

        style = "bold blue";
        format = "[$symbol]($style) ";
      };

      username = {
        show_always = true;

        style_user = "bold green";
        style_root = "bold red";

        format = "[$user]($style)";
      };

      hostname = {
        ssh_only = false;

        style = "bold yellow";

        format = "[@$hostname]($style) ";
      };

      palettes.noctalia = {
        # Standard colors
        blue = "#f0b7c5";
        red = "#ffb4ab";
        green = "#d2bcfd";
        yellow = "#cdc2db";
        cyan = "#cdc2db";
        magenta = "#d2bcfd";
        white = "#e7e0e8";
        black = "#49454e";

        # Extended palette
        rosewater = "#cdc2db";
        flamingo = "#ffb4ab";
        pink = "#d2bcfd";
        mauve = "#d2bcfd";
        maroon = "#ffb4ab";
        peach = "#cdc2db";
        teal = "#cdc2db";
        sky = "#cdc2db";
        sapphire = "#f0b7c5";
        lavender = "#d2bcfd";

        # Text shades
        text = "#e7e0e8";
        subtext1 = "#e7e0e8";
        subtext0 = "#948f99";

        # Surface shades
        overlay2 = "#948f99";
        overlay1 = "#948f99";
        overlay0 = "#49454e";
        surface2 = "#49454e";
        surface1 = "#49454e";
        surface0 = "#151218";
        base = "#151218";
        mantle = "#151218";
        crust = "#151218";
      };
    };
  };
}

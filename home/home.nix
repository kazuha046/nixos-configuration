{ inputs, pkgs, ... }:

{
  imports = [
    inputs.niri.homeModules.config
    inputs.noctalia.homeModules.default
    inputs.spicetify-nix.homeManagerModules.default
    inputs.dynamic-drpc-wayland.homeManagerModules.default
    inputs.nixcord.homeModules.nixcord

    ./modules/packages.nix
    ./modules/desktop.nix
    ./modules/environment.nix
    ./modules/xdg.nix
    ./modules/kdeconnect.nix
    ./modules/starship.nix
    ./modules/fish.nix
    ./modules/spicetify.nix
    ./modules/ddsw.nix
    ./modules/bot.nix

    ./programs/vscode.nix
    ./programs/ghostty.nix
    ./programs/nixcord.nix
    ./programs/yazi.nix
    ./programs/mpv.nix
    ./programs/lsd.nix
    ./programs/fastfetch.nix
    ./programs/minecraft.nix
    ./programs/obs.nix
    ./programs/nvim.nix
    ./programs/fzf.nix
    ./programs/handy.nix

    ./dotfiles/noctalia/default.nix
    ./dotfiles/niri/default.nix
  ];

  home.username = "mrkir";
  home.homeDirectory = "/home/mrkir";

  home.stateVersion = "26.05";

  home.pointerCursor = {
    enable = true;

    name = "material_cursors";
    package = pkgs.material-cursors;
    size = 32;

    gtk.enable = true;
    x11.enable = true;
  };

  programs.home-manager.enable = true;
}

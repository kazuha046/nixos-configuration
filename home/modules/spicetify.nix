{ pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  programs.spicetify = {
    enable = true;
    experimentalFeatures = true;
    alwaysEnableDevTools = true;

    theme = spicePkgs.themes.sleek;

    colorScheme = "custom";

    customColorScheme = {
      text = "e7e0e8";
      subtext = "cbc4cf";
      main = "49454e";
      highlight = "cbc4cf";
      misc = "948f99";
      notification = "f0b7c5";
      notification-error = "ffb4ab";
      shadow = "000000";
      card = "2b292f";
      player = "49454e";
      sidebar = "151218";
      main-elevated = "36343a";
      selected-row = "cbc4cf";
      button = "d2bcfd";
      button-active = "d2bcfd";
      button-disabled = "948f99";
    };

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      hidePodcasts
      shuffle
    ];
  };
}

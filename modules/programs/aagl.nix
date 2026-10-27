{ inputs, ... }:

{
  imports = [
    inputs.aagl.nixosModules.default
  ];

  programs.anime-games-launcher.enable = true;
}

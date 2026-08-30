{ pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableFishIntegration = true;

    package = pkgs.unstable.fzf;
  };
}

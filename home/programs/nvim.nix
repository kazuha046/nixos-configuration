{ pkgs, ... }:

{
  home.file.".config/nvim" = {
    source = pkgs.fetchFromGitHub {
      owner = "AstroNvim";
      repo = "template";
      rev = "84b6c9957f7aa36611b963f017bc082a6d60e64f";
      hash = "sha256-79MWHQ6oMPIhbJPtSEi0VxlYpvKJbhu0+PV/COBLhYg=";
    };

    recursive = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}

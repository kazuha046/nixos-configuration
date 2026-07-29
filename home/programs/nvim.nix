{ pkgs, ... }:

{
  home.file.".config/nvim" = {
    source = pkgs.fetchFromGitHub {
      owner = "AstroNvim";
      repo = "template";
      rev = "main";
      hash = "sha256-zrwpZ6Ow5qL9dml5gJFmLEOlQa02qm/AdFYGlfpw8fY=";
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

{ pkgs-unstable, ... }:

{
  programs.mpv = {
    enable = true;

    package = pkgs-unstable.mpv.override {
      scripts = [ pkgs-unstable.mpvScripts.modernx ];
    };

    config = {
      osc = "no";
      border = "yes";

      autofit-large = "85%x85%";
      geometry = "75%x75%";

      gpu-context = "wayland";
    };
  };
}

{ pkgs, ... }:

{
  xdg.configFile."obs-studio/basic/profiles/Untitled" = {
    source = ../../assets/obs/profile/Untitled;
    recursive = true;
    force = true;
  };

  xdg.configFile."obs-studio/basic/scenes/Untitled.json" = {
    source = ../../assets/obs/Untitled.json;
    force = true;
  };

  programs.obs-studio = {
    enable = true;

    package = pkgs.obs-studio.override {
      cudaSupport = true;
    };

    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
      obs-pipewire-audio-capture
      obs-vkcapture
      obs-source-record
      obs-move-transition
      obs-vaapi
      obs-gstreamer
      input-overlay
    ];
  };
}

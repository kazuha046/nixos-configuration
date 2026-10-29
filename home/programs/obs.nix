{ pkgs, ... }:

{
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
      obs-vaapi
      obs-gstreamer
      input-overlay
    ];
  };
}

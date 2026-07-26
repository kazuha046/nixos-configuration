{ pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;

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

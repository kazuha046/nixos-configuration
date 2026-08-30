{ pkgs, ... }:

{
  services.easyeffects = {
    enable = true;

    package = pkgs.unstable.easyeffects;

    preset = "fifine_am8";
  };

  xdg.configFile."easyeffects/input/fifine_am8.json" = {
    source = ../../assets/fifine_am8.json;
    force = true;
  };
}

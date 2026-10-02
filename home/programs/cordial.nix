{ pkgs, config, ... }:

{
  home.file.".local/share/icons/cordial.svg".source = ../../assets/icons/cordial.svg;

  home.packages = with pkgs; [
    (makeDesktopItem {
      name = "cordial";
      desktopName = "Cordial";
      comment = "Roblox runtime for Linux";
      exec = "${config.home.homeDirectory}/Applications/Cordial_x86_64.AppImage %u";
      icon = "cordial";
      terminal = false;
      categories = [ "Game" ];
      mimeTypes = [ "x-scheme-handler/roblox" ];
    })
  ];
}

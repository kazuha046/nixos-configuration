{ pkgs, config, ... }:

{
  home.file.".local/share/icons/hicolor/scalable/apps/cordial.svg".source =
    ../../assets/icons/cordial.svg;

  home.packages = with pkgs; [
    (makeDesktopItem {
      name = "cordial";
      desktopName = "Cordial";
      comment = "Roblox runtime for Linux";
      exec = "steam-run  ${config.home.homeDirectory}/Applications/Cordial_x86_64.AppImage";
      icon = "cordial";
      terminal = false;
      categories = [ "Game" ];
      mimeTypes = [ "x-scheme-handler/roblox" ];
    })
  ];
}

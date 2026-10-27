{ pkgs, config, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };

    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome-themes-extra;
    };

    cursorTheme = {
      name = "material-cursors";
      package = pkgs.material-cursors;
      size = 24;
    };

    gtk3.bookmarks = [
      "file:///mnt/games Games"
      "file://${config.home.homeDirectory}/Downloads"
      "file://${config.home.homeDirectory}/Documents"
      "file://${config.home.homeDirectory}/Pictures"
      "file://${config.home.homeDirectory}/Videos"
      "file://${config.home.homeDirectory}/Music"
    ];
  };

  qt = {
    enable = true;

    platformTheme.name = "xdgdesktopportal";

    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };
}

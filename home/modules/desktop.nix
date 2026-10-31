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
      "file://${config.home.homeDirectory}/Downloads"
      "file:///mnt/storage/Documents"
      "file:///mnt/storage/Projects"
      "file:///mnt/storage/Pictures"
      "file:///mnt/storage/Videos"
      "file:///mnt/storage/Music"
      "file:///mnt/games Games"
      "file:///mnt/storage Storage"
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

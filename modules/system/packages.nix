{ pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages =
    (with pkgs; [
      # Desktop / GUI base
      libayatana-appindicator
      libappindicator
      p7zip
      amberol

      # Filesystem / compatibility
      distrobox
      ntfs3g
      gvfs
      unar
      glib
      fuse3
      dconf
      xdg-utils
      gtk3
      shared-mime-info
      libxshmfence
      libsForQt5.qt5ct
      qt6Packages.qt6ct
      dxvk
      meson
      gnumake
      gcc
      dotool
      ydotool
      wtype
      virtiofsd
      virtio-win

      # File previews / GUI utilities
      ffmpegthumbnailer
      file-roller
      poppler
      loupe

      # Wayland / X11 bridge
      xwayland-satellite

      # Boot / system tools
      plymouth
      efibootmgr
      cachix

      # Security / auth
      polkit
      gnome-keyring
      libsecret

      # Shell / dev tools
      android-tools
      openssh
      tree
      clippy
      openssl
      rustfmt
      rustup
      uv
      nodejs_24
      dotnet-sdk_9
      jdk21
      jdk25
      go
      gh
    ])
    ++ (with pkgs-unstable; [
      # Desktop / GUI base
      ghostty
      nautilus
      gnome-calendar
      gnome-control-center
      gnome-online-accounts
      sushi
      webp-pixbuf-loader
      nautilus-python
      gnome-text-editor

      # Shell / dev tools
      bun
      fish
      git
    ]);
}

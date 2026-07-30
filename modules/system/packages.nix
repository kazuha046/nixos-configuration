{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # Desktop / GUI base
    ghostty
    nautilus
    sushi
    webp-pixbuf-loader
    nautilus-python
    gnome-text-editor
    mpv
    amberol
    libayatana-appindicator
    libappindicator

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
    unar
    loupe

    # Wayland / X11 bridge
    xwayland-satellite

    # Boot / system tools
    os-prober
    plymouth
    efibootmgr

    # Themes
    material-cursors

    # Security / auth
    polkit
    gnome-keyring
    libsecret

    # Shell / dev tools
    android-tools
    fish
    openssh
    git
    tree
    clippy
    openssl
    rustfmt
    rustup
    uv
    nodejs_24
    bun
    dotnet-sdk_9
    jdk21
    go
    qemu
  ];
}

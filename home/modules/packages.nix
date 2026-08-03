{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Browsers / Internet
    librewolf
    tor-browser
    chromium
    ayugram-desktop

    # Dev / IDE / Tools
    vscode
    unityhub
    obsidian
    nixfmt
    nixd
    jetbrains.webstorm
    jetbrains.pycharm
    jetbrains.rider
    jetbrains.rust-rover
    jetbrains.datagrip
    android-studio
    libnotify
    onlyoffice-desktopeditors
    evince
    hyprpicker
    opencode
    localsend
    fzf
    sqlite
    obs-cmd

    # Gaming
    steam
    steam-run
    gamescope

    # Mods / tweaks
    gamemode
    mangohud
    goverlay
    vkbasalt

    # Clipboard / productivity
    wl-clipboard
    wl-clip-persist
    cliphist
    anki

    # Media / wallpapers
    mpvpaper
    easyeffects
    pavucontrol
    gimp

    # GUI system tools
    networkmanagerapplet
    blueman
    mission-center
    scrcpy

    # Bluetooth stack (user tools)
    bluez

    # CLI tools
    ripgrep
    fd
    bat
    eza
    jq
    unzip
    zip
    curl
    wget
    btop
    dust
    duf
    dex

    # Terminal things
    cava
    cmatrix
    nyancat
    unimatrix
    asciiquarium
    cbonsai
    tty-clock
    bb
    bastet
    glow
    pipes-rs
    lavat
    mapscii
    sl
    hollywood

    # Icons / themes
    adwaita-icon-theme
    hicolor-icon-theme

    (makeDesktopItem {
      name = "dex";
      desktopName = "Dex Launcher";
      exec = "dex %f";
      terminal = false;
      mimeTypes = [ "application/x-desktop" ];
    })

    (writeShellScriptBin "pineconemc" ''
      exec "$HOME/Applications/PineconeMC-Linux-x86_64.AppImage" "$@"
    '')
  ];
}

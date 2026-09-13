{ pkgs, ... }:

{
  home.packages =
    (with pkgs; [
      # Dev / IDE / Tools
      obsidian
      nixfmt
      nixd
      jetbrains.webstorm
      jetbrains.pycharm
      jetbrains.rust-rover
      jetbrains.datagrip
      android-studio
      libnotify
      onlyoffice-desktopeditors
      evince
      hyprpicker
      sqlite
      obs-cmd
      postman

      # Clipboard / productivity
      wl-clipboard
      wl-clip-persist
      cliphist
      anki

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
      lsof
      dig

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
    ])
    ++ (with pkgs.unstable; [
      # Dev / IDE / Tools
      opencode
      localsend
      fzf
      qbittorrent

      # Browsers / Internet
      librewolf
      tor-browser
      chromium
      ayugram-desktop
      hydralauncher

      # GUI system tools
      networkmanagerapplet
      blueman
      mission-center
      scrcpy

      # Bluetooth stack (user tools)
      bluez

      # Gaming
      steam-run
      gamescope

      # Mods / tweaks
      gamemode
      mangohud
      goverlay
      vkbasalt

      # Media / wallpapers
      mpvpaper
      easyeffects
      pavucontrol
      gimp
    ]);
}

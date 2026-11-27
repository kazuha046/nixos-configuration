{
  pkgs,
  pkgs-unstable,
  craftapps,
  ...
}:

{
  home.packages =
    (with pkgs; [
      # Dev / IDE / Tools
      obsidian
      nixfmt
      nixd
      jetbrains.datagrip
      android-studio
      libnotify
      onlyoffice-desktopeditors
      evince
      hyprpicker
      sqlite
      obs-cmd
      postman
      qrencode

      # Craft Apps
      craftapps.packages.${pkgs.stdenv.hostPlatform.system}.photocraft
      craftapps.packages.${pkgs.stdenv.hostPlatform.system}.vectorcraft
      craftapps.packages.${pkgs.stdenv.hostPlatform.system}.effectcraft
      craftapps.packages.${pkgs.stdenv.hostPlatform.system}.filmcraft
      craftapps.packages.${pkgs.stdenv.hostPlatform.system}.wordcraft

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

      # Mods / tweaks
      goverlay

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
    ])
    ++ (with pkgs-unstable; [
      # Dev / IDE / Tools
      localsend
      qbittorrent
      opencode

      # Browsers / Internet
      tor-browser
      chromium
      ayugram-desktop
      hydralauncher

      # GUI system tools
      networkmanagerapplet
      mission-center
      scrcpy

      # Bluetooth stack (user tools)
      bluez

      # Gaming
      steam-run
      gamescope
      r2modman

      (pineconemc.override {
        gamemodeSupport = true;

        additionalPrograms = [ mangohud ];

        jdks = [
          jdk21
          jdk25
        ];
      })

      # Mods / tweaks
      mangohud
      vkbasalt

      # Media / wallpapers
      mpvpaper
      pavucontrol
      gimp
    ]);
}

{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    jetbrains-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    inter
    roboto
    corefonts
  ];

  system.userActivationScripts = {
    copy-all-fonts-for-onlyoffice = {
      text = ''
        TARGET_DIR="$HOME/.local/share/fonts/onlyoffice"

        rm -rf "$TARGET_DIR"
        mkdir -p "$TARGET_DIR"

        find -L /run/current-system/sw/share/fonts/ -type f \( -name "*.ttf" -o -name "*.otf" -o -name "*.ttc" \) -exec cp -p {} "$TARGET_DIR/" \;

        chmod 644 "$TARGET_DIR"/* || true
      '';
    };
  };
}

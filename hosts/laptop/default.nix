{ ... }:

{
  imports = [
    ./hardware-configuration.nix

    ../../modules/system/boot.nix
    ../../modules/system/networking.nix
    ../../modules/system/locale.nix
    ../../modules/system/users.nix
    ../../modules/system/packages.nix
    ../../modules/system/security.nix
    ../../modules/system/state.nix
    ../../modules/system/environment.nix

    # ../../modules/desktop/sddm.nix
    ../../modules/desktop/graphics.nix
    ../../modules/desktop/niri.nix
    ../../modules/desktop/greetd.nix
    ../../modules/desktop/fonts.nix
    ../../modules/desktop/hyprland.nix

    ../../modules/virtualisation/podman.nix
    ../../modules/virtualisation/ollama.nix
    ../../modules/virtualisation/docker.nix
    ../../modules/virtualisation/kvm.nix

    ../../modules/programs/nix-ld.nix
    ../../modules/programs/direnv.nix
    ../../modules/programs/throne.nix
    ../../modules/programs/appimage.nix
    ../../modules/programs/ydotool.nix
    ../../modules/programs/creamlinux.nix

    ../../modules/services/keyring.nix
    ../../modules/services/xwayland.nix
    ../../modules/services/bluetooth.nix
    ../../modules/services/gnome.nix
    ../../modules/services/pipewire.nix
  ];
}

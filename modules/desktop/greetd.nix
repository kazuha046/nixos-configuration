{ pkgs, inputs, ... }:

let
  noctalia-greeter = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;
in
{
  imports = [
    inputs.noctalia-greeter.nixosModules.default
  ];

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${noctalia-greeter}/bin/noctalia-greeter-session -- --user mrkir --session niri";
        user = "greeter";
      };
    };
  };

  services.displayManager.noctalia-greeter = {
    enable = true;

    settings = {
      cursor = {
        theme = "material_cursors";
        size = 32;
        path = "${pkgs.material-cursors}/share/icons";
      };

      keyboard = {
        layout = "us,ru";
        options = "grp:win_space_toggle";
        numlock = true;
      };

      appearance = {
        hide_logo = true;
      };
    };
  };
}

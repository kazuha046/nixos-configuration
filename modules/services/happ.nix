{ inputs, ... }:

{
  imports = [
    inputs.happ.nixosModules.default
  ];

  services.happ.enable = true;
}

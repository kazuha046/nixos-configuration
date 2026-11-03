{ inputs, ... }:

{
  imports = [
    inputs.koala-clash.nixosModules.default
  ];

  programs.koala-clash.enable = true;
}

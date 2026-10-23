{
  inputs,
  pkgs,
  lib,
  ...
}:

{
  services.handy = {
    enable = true;
  };

  systemd.user.services.handy.Service.ExecStart = lib.mkForce "${
    inputs.handy.packages.${pkgs.stdenv.hostPlatform.system}.default
  }/bin/handy --start-hidden";
}

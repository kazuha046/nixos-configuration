{ pkgs, ... }:

let
  extra-path = with pkgs; [
    dotnet-sdk_8
    mono
    msbuild
    nuget
  ];
in
{
  home.packages = [
    pkgs.unityhub

    (pkgs.jetbrains.rider.overrideAttrs (oldAttrs: {
      postInstall = (oldAttrs.postInstall or "") + ''
        wrapProgram $out/bin/rider \
          --prefix PATH : ${pkgs.lib.makeBinPath extra-path}
      '';
    }))
  ];
}

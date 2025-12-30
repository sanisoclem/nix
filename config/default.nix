{
  inputs,
  host,
  lib,
  ...
}: {
  imports = [
    ./btop.nix
    inputs.lazyvim.homeManagerModules.default
  ];
}

{
  inputs,
  host,
  lib,
  ...
}: {
  imports = [
    ./btop.nix
    ./ghostty.nix
    ./eza.nix
    ./noctalia.nix
  ];
}

{inputs, pkgs, ...}: {
  imports = [
    ./sddm.nix
    ./quickshell.nix
    ./noctalia.nix
    inputs.stylix.nixosModules.stylix
  ];
}

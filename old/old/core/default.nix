{inputs, pkgs, ...}: {
  imports = [
    ./sddm.nix
    ./quickshell.nix
    inputs.stylix.nixosModules.stylix
  ];
}

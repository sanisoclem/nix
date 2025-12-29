{inputs, ...}: {
  imports = [
    ./sddm.nix
    inputs.stylix.nixosModules.stylix
  ];
}

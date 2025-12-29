{inputs, ...}: {
  imports = [
    ./sddm.nix
    inputs.stylix.nixosModules.stylix
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}

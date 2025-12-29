{
  description = "Mel Nix Flake";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nvf.url = "github:notashelf/nvf";
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    superfile.url = "github:yorukot/superfile";
    utils.url = "github:numtide/flake-utils";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    quickshell = {
      url = "github:outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
    lazyvim.url = "github:pfassina/lazyvim-nix";
  };
  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";

    mkHost = {
      hostname,
      username,
    }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
          host = hostname;
          inherit username;
          zen-browser = inputs.zen-browser.packages.${system}.default;
          superfile = inputs.superfile.packages.${system}.default;
        };
        modules = [
          ./entry.nix
        ];
      };
  in {
    nixosConfigurations = {
      melnix = mkHost {
        hostname = "melnix";
        username = "mel";
      };
    };
  };
}

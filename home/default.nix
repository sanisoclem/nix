{
  inputs,
  host,
  lib,
  ...
}: {
  imports = [
    ./btop.nix
  ];

  qt.enable = true;
  xdg.enable = true;
  programs = {
    lazyvim.enable = true;
    zsh = {
      enable = true;
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
    starship.enable = true;
    lazygit.enable = true;
  };
}

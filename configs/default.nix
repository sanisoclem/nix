{
  inputs,
  host,
  lib,
  ...
}: {
  imports = [
    ./btop.nix
    ./eza.nix
    ./fzf.nix
    ./ghostty.nix
    ./git.nix
    # ./rofi
    # ./scripts
    # ./starship.nix
    # ./stylix.nix
    ./swappy.nix
    ./tealdeer.nix
    ./wlogout
    ./environment.nix
    ./niri
    ./hyprland
    ./fish
    ./fishrc-personal.nix
    ./zsh
    ./noctalia-shell
  ];

  qt.enable = true;
  xdg.enable = true;
  programs = {
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableNushellIntegration = true;
      enableZshIntegration = true;
    };
    starship.enable = true;
    lazygit.enable = true;
  };

  stylix.targets = {
    waybar.enable = false;
    rofi.enable = false;
    hyprland.enable = false;
    hyprlock.enable = false;
    ghostty.enable = false;
    qt.enable = true;
  };
  services.nwg-drawer-stylix.enable = true;
}

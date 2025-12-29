{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./configs
  ];

  home = {
    username = "mel";
    homeDirectory = "/home/mel";
    stateVersion = "25.11";
    shellAliases = {
      ls = "eza";
      lt = "eza --tree --level=2";
      ll = "eza  -lh --no-user --long";
      la = "eza -lah ";
      tree = "eza --tree ";
    };
  };

  programs = {
    lazyvim.enable = true;
    fastfetch.enable = true;
    git.enable = true;
    bash = {
      enable = false;
    };
  };
}

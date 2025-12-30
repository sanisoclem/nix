{pkgs, ...}: {
  home.packages = with pkgs; [fish];

  home.file."./.fishrc-personal".text = ''
    # This file allows you to define your own Fish shell customizations
    # Below are examples migrated from zshrc-personal

    # Environment variables
    set -gx EDITOR "nvim"
    set -gx VISUAL "nvim"
  '';
}

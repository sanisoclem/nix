{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./home
  ];

  home = {
    username = "mel";
    homeDirectory = "/home/mel";
    stateVersion = "25.11";
  };

  programs = {
    alacritty.enable = true; # Super+T in the default setting (terminal)
    fuzzel.enable = true; # Super+D in the default setting (app launcher)
    swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
    waybar.enable = true; # launch on startup in the default setting (bar)
    bash = {
      enable = true;
      shellAliases = {
        btw = "echo I use nixos, btw";
      };
    };
    lazyvim.enable = true;
    fastfetch.enable = true;
    git.enable = true;
  };
  services = {
    mako.enable = true; # notification daemon
    swayidle.enable = true; # idle management daemon
    polkit-gnome.enable = true; # polkit
  };

  home.packages = with pkgs; [
    swaybg # wallpaper
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}

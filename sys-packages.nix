{
  pkgs,
  zen-browser,
  system,
  lib,
  ...
}: {
  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    neovim
    ghostty
    btop
    bat
    xclip
    bluetui
    xwayland-satellite
    zellij
    fnm
    gh
    uv
    duf
    ffmpeg
    eza
    gdu # TUI for disk usage
    pavucontrol
    playerctl
    youtube-music
    localsend
    onefetch
    fastfetch
    obsidian
    zen-browser
    kdePackages.qt6ct
    kdePackages.kcalc

    libgcc # for cc linker needed by rust
  ];

  programs = {
    direnv.enable = true;
    niri.enable = true;
    firefox.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
    starship = {
      enable = true;
    };
    neovim = {
      enable = false;
      defaultEditor = false;
    };
  };

  nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "obsidian"
    ];
}

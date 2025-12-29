{
  pkgs,
  zen-browser,
  superfile,
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
    alacritty
    fuzzel
    swaylock
    mako
    swayidle
    swaybg
    xwayland-satellite
    rustup
    vimplugin-LazyVim
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
    waypaper
    youtube-music
    localsend
    rofi-emoji
    onfefetch
    fastfetch
    obsidian
    superfile
    zen-browser
    ffmpegthumbnailer
  ];

  programs = {
    fish.enable = true;
    zsh.enable = true;
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
    dconf.enable = true;
    seahorse.enable = true;
    hyprland = {
      enable = true;
      package = pkgs.hyprland;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
    hyprlock.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    adb.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };
}

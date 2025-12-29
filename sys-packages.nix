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

    inputs.quickshell.packages.${pkgs.system}.default
    qt6.qt5compat
    qt6.qtbase
    qt6.qtquick3d
    qt6.qtwayland
    qt6.qtdeclarative
    qt6.qtsvg
    kdePackages.qt5compat
    libsForQt5.qt5.qtgraphicaleffects
  ];

  environment.variables = {
    QML_IMPORT_PATH = "${pkgs.qt6.qt5compat}/lib/qt-6/qml:${pkgs.qt6.qtbase}/lib/qt-6/qml";
    QML2_IMPORT_PATH = "${pkgs.qt6.qt5compat}/lib/qt-6/qml:${pkgs.qt6.qtbase}/lib/qt-6/qml";
  };

  # make sure the Qt application is working properly
  environment.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
  };

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

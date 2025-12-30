{
  config,
  lib,
  pkgs,
  ...
}: let 
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "pixel_sakura";
    themeConfig = {
      FormPosition = "left";
      Blur = "4.0";
        };
  };
  in 
{
  imports = [
    ./hardware-configuration.nix
    ./sys-packages.nix
    ./noctalia.nix
  ];

  boot = {
    kernelModules = [ "amdgpu" ];
    kernelParams = [ "radeon.audio=1" ];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
  networking = {
    hostName = "melnix";
    networkmanager.enable = true;
    firewall.allowedTCPPorts = [22];
  };

  # Set your time zone.
  time.timeZone = "Australia/Melbourne";

  services = {
    openssh.enable = true;
    blueman.enable = true;
    power-profiles-daemon.enable = true;
    upower.enable = true;
    xserver = {
      enable = false;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
    };
    displayManager = {
      sddm = {
        package = pkgs.kdePackages.sddm;
        extraPackages = [sddm-astronaut];
        enable = true;
        wayland.enable = true;
        theme = "sddm-astronaut-theme";
      };
    };
  };

  users.users.mel = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "audio"
      "networkmanager"
      "scanner"
      "adbusers"
      "docker"
      "lp"
    ];
    packages = with pkgs; [
      tree
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    neovim
    ghostty
    btop
    bat
    xclip
    sddm-astronaut
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    dejavu_fonts
    fira-code
    fira-code-symbols
    font-awesome
    jetbrains-mono
    material-icons
    maple-mono.NF
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.meslo-lg
    nerd-fonts.hack
  ];

  nix.settings.experimental-features = ["nix-command" "flakes"];

  hardware.bluetooth.enable = true;
  hardware.enableRedistributableFirmware = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  systemd.tmpfiles.rules = ["L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"];

  system.stateVersion = "25.11"; # Did you read the comment?
}

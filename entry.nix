{
  config,
  lib,
  pkgs,
  inputs,
  username,
  host,
  ...
}: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    ./core/default.nix
    ./optional.nix
    ./sys-packages.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking = {
    firewall.allowedTCPPorts = [22];
    networkmanager.enable = true;
    hostName = "melnix";
  };

  # Set your time zone.
  time.timeZone = "Australia/Melbourne";

  programs.niri.package = pkgs.niri;

  services = {
    gnome.gnome-keyring.enable = true;
    openssh.enable = true;
    blueman.enable = true;
    displayManager = {
      sddm.enable = true;
      sessionPackages = [pkgs.niri];
    };
    printing = {
      enable = true;
      drivers = [
      ];
    };
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
    ipp-usb.enable = true;
    pulseaudio.enable = true;
    xserver = {
      enable = false;
      xkb = {
        layout = "us";
        variant = "";
      };
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
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
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = false;
    backupFileExtension = "backup";
    extraSpecialArgs = {
      inherit
        inputs
        username
        host
        ;
    };
    users.${username} = import ./home.nix;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    dejavu_fonts
    fira-code
    fira-code-symbols
    noto-fonts
    noto-fonts-emoji
    noto-fonts-cjk-sans
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

  security = {
    rtkit.enable = true;
    polkit = {
      enable = true;
      extraConfig = ''
        polkit.addRule(function(action, subject) {
          if ( subject.isInGroup("users") && (
           action.id == "org.freedesktop.login1.reboot" ||
           action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
           action.id == "org.freedesktop.login1.power-off" ||
           action.id == "org.freedesktop.login1.power-off-multiple-sessions"
          ))
          { return polkit.Result.YES; }
        })
      '';
    };
    pam.services.swaylock = {
      text = ''auth include login '';
    };
  };

  system.stateVersion = "25.11"; # Did you read the comment?
}

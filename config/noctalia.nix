{ pkgs, inputs, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      bar = {
        density = "compact";
        position = "left";
        showCapsule = false;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "index";
            }
          ];
          right = [
            {
              id = "WiFi";
            }
            {
              id = "Bluetooth";
            }
            {
              formatHorizontal = "HH:mm";
              formatVertical = "HH mm";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
          ];
        };
      };
      colorSchemes = {
        darkMode = true;
        generateTemplatesForPredefined = true;
        manualSunrise = "06:30";
        manualSunset = "18:30";
        predefinedScheme = "Catppuccin";
        schedulingMode = "off";
      };
      general = {
        avatarImage = pkgs.fetchurl {
          name = "profile.jpg";
          url = "https://avatars.githubusercontent.com/u/758633?v=4";
          hash = "sha256-CXDcDes8AOEIMJsEwH7X977sdG6J01leRD8nZE3GUF8=";
        };
        radiusRatio = 0.2;
      };
      location = {
        monthBeforeDay = true;
        name = "Melbourne, Australia";
      };
      nightLight = {
        autoSchedule = true;
        dayTemp = "6500";
        enabled = true;
        forced = false;
        manualSunrise = "06:30";
        manualSunset = "18:30";
        nightTemp = "4000";
      };
      wallpaper = {
        directory = "/home/mel/Pictures/Wallpapers";
        enabled = true;
        fillColor = "#000000";
        fillMode = "crop";
        overviewEnabled = false;
        panelPosition = "follow_bar";
        randomEnabled = true;
        randomIntervalSec = 300;
        recursiveSearch = false;
        setWallpaperOnAllMonitors = true;
        transitionDuration = 1500;
        transitionEdgeSmoothness = 0.05;
        transitionType = "random";
        wallpaperChangeMode = "random";
      };
      dock = {
        enabled = true;  
      };
      ui = {
        fontDefault = "Hack Nerd Font";
        fontDefaultScale = 1;
        fontFixed = "FiraCode Nerd Font Mono";
        fontFixedScale = 1;
        panelBackgroundOpacity = 0.93;
        panelsAttachedToBar = true;
        settingsPanelMode = "centered";
      };
    };
  };
}

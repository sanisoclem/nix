{ lib, pkgs, inputs, ... }:
{
  imports = [
    ./config
    inputs.lazyvim.homeManagerModules.default
  ];

  home = {
    username = "mel";
    homeDirectory = "/home/mel";
    stateVersion = "25.11";
  };

  qt.enable = true;
  xdg.enable = true;
  programs = {
    zsh = {
      enable = true;
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
    };
    home-manager.enable = true;
    starship.enable = true;
    lazygit.enable = true;
    alacritty.enable = true; # Super+T in the default setting (terminal)
    fuzzel.enable = true; # Super+D in the default setting (app launcher)
    swaylock.enable = true; # Super+Alt+L in the default setting (screen locker)
    waybar.enable = true; # launch on startup in the default setting (bar)
    bash = {
      enable = true;
      shellAliases = {
        ls = "eza";
        lt = "eza --tree --level=2";
        ll = "eza  -lh --no-user --long";
        la = "eza -lah ";
        tree = "eza --tree ";
      };
      initExtra = lib.mkOrder 2000
      ''
        eval "$(${lib.getExe pkgs.fzf} --bash)"    
      '';
    };
    neovim.plugins = [
      pkgs.vimPlugins.nvim-treesitter
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      pkgs.vimPlugins.nvim-treesitter-parsers.wgsl
      pkgs.vimPlugins.nvim-treesitter-parsers.wgsl_bevy
      pkgs.vimPlugins.statix
      pkgs.vimPlugins.nvim-vtsls
    ];
    fastfetch.enable = true;
    lazyvim = {
      enable = true;
      pluginSource = "nixpkgs";
      installCoreDependencies = true;
      extras = {
        lang.nix.enable = true;
        lang.tailwind.enable = true;
        lang.svelte = {
          enable = true;
          installDependencies = true;
          installRuntimeDependencies = true;
        };
        lang.typescript = {
          enable = true;
          installDependencies = true;
          installRuntimeDependencies = true;
        };
        lang.rust = {
          enable = true;
          installDependencies = true;
          installRuntimeDependencies = false;
          config = ''
            return {
              "neovim/nvim-lspconfig",
              opts = {
                servers = {
                  rust_analyzer = {
                    settings = {
                      ["rust-analyzer"] = {
                        cargo = { features = "all" },
                      },
                    },
                  },
                },
              },
            }
          '';
        };
      };

      # Additional packages (optional)
      extraPackages = with pkgs; [
        tree-sitter
        bacon
        nixd       # Nix LSP
        alejandra  # Nix formatter
        statix
        svelte-language-server
        tailwindcss-language-server
        typescript-language-server
        wgsl-analyzer
        vtsls
      ];

      treesitterParsers = with pkgs.vimPlugins.nvim-treesitter-parsers; [
        wgsl
        # svelte
      ];  
    };
    git = {
      enable = true;
      settings = {
        user = {
          name = "sanisoclem";
          email = "mel@busstop.dev";
        };
        push.default = "simple";
        alias = {
          tree = "log --oneline --decorate --all --graph";
          acm = "!git add . && git commit -m";
          ac = "!git add . && git commit";
          acf = "!git add . && git commit --fixup HEAD";
          ds = "diff --stat";
          dc = "diff --cached";
          dcs = "diff --stat --cached";
          s = "status -s";
          co = "checkout";
          cob = "checkout -b";
          com = "checkout origin/master";
          com2 = "checkout origin/main";
          puush = "push -u origin HEAD";
          pf = "push -f";
          poof = "push -f";
          rst = "reset HEAD --hard";
          rbmi = "rebase origin/master -i --autosquash";
          rbmi2 = "rebase origin/main -i --autosquash";
          cleanup = "!git fetch --prune -v && git co master && git merge origin/master --ff-only && git branch --merged | grep -v '\\*' > /tmp/merged && vi /tmp/merged && xargs git branch -d < /tmp/merged";
          cleanup2 = "!git fetch --prune -v && git co main && git merge origin/main --ff-only && git branch --merged | grep -v '\\*' > /tmp/merged-main && vi /tmp/merged-main && xargs git branch -d < /tmp/merged-main";
        };
      };
    };
  };
  services = {
    mako.enable = true; # notification daemon
    swayidle.enable = true; # idle management daemon
    polkit-gnome.enable = true; # polkit
  };

  home.packages = with pkgs; [
    swaybg # wallpaper
    harlequin
    python313Packages.harlequin-postgres
    fzf
  ];

  xdg.configFile."niri/config.kdl".source = ./config.kdl;
}

{pkgs, ...}: {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;
  };
  home.file."./.config/ghostty/config".text = ''
    theme = Dracula
    keybind = clear
    window-decoration = false
    title = ""

    window-theme = dark
    background-opacity = 0.95
    background-blur-radius = 60
    selection-background = #2d3f76
    selection-foreground = #c8d3f5
    cursor-style = bar
    mouse-hide-while-typing = true

    wait-after-command = false
    shell-integration = detect
    window-save-state = always
    gtk-single-instance = true
    unfocused-split-opacity = 0.5
    quick-terminal-position = center
    shell-integration-features = cursor,sudo
    keybind = ctrl+shift+c=copy_to_clipboard
    keybind = ctrl+shift+v=paste_from_clipboard

  '';
}

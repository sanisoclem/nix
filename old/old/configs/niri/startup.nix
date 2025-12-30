{host, ...}: let
  barStartupCommand = ''spawn-at-startup "noctalia-shell"'';
in ''
  ${barStartupCommand}
  spawn-at-startup "bash" "-c" "swww-daemon && sleep 1 && swww img '../../wallpapers/default.jpeg'"
''

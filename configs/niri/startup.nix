{
  host,
  stylixImage,
  startupApps,
  barChoice,
  ...
}: let
  barStartupCommand = ''spawn-at-startup "noctalia-shell"'';
in ''
  spawn-at-startup "bash" "-c" "wl-paste --watch cliphist store &"
  ${barStartupCommand}
  spawn-at-startup "bash" "-c" "swww-daemon && sleep 1 && swww img '../../wallpapers/default.jpeg'"
  spawn-at-startup "wal" "-R"
  spawn-at-startup "/usr/lib/mate-polkit/polkit-mate-authentication-agent-1"
  spawn-at-startup "vesktop"
  spawn-at-startup "Telegram"
''

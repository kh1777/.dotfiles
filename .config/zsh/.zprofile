source "$ZDOTDIR/env.zsh"
 
if [ -z "$WAYLAND_DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
	start-hyprland
fi

source /home/amelia/.config/fish/xdg.fish

set -gx GTK_THEME 'Catppuccin-Macchiato-Standard-Pink-dark:dark'

function neofetch 
	SHELL="/usr/bin/fish" neowofetch
end

function gae
	SHELL="/usr/bin/fish" hyfetch
end

function owofetch
	SHELL="/usr/bin/fish" uwufetch
end

# function fish_greeting
#     hyfetch
# end

# starship init fish | source

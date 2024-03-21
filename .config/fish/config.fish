source /home/amelia/.config/fish/xdg.fish

set -gx GTK_THEME 'Catppuccin-Macchiato-Standard-Pink-dark:dark'

function neofetch
    SHELL="/usr/bin/fish" /usr/bin/neofetch
end

function transfetch
    SHELL="/usr/bin/fish" /usr/bin/neofetch --ascii ~/.config/neofetch/ascii --ascii_colors 6 5 "\e[38;2;239;241;245" 5 6
end

function gaefetch
    SHELL="/usr/bin/fish" /usr/bin/neofetch --ascii ~/.config/neofetch/ascii --ascii_colors 9 "\e[38;2;245;169;127" "\e[38;2;239;241;245" 5 "\e[38;2;198;160;246"
end

function uwufetch
    SHELL="/usr/bin/fish" /usr/bin/uwufetch
end

function fish_reload
    source $XDG_CONFIG_HOME/fish/config.fish
end

# function fish_greeting
#     hyfetch
# end

# starship init fish | source

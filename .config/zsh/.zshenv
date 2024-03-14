export TERMINAL="wezterm"
export EDITOR="nvim"
export VISUAL="codium"

# -------------------------------
# |      Force XDG Paths        |
# -------------------------------
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state
export XDG_BIN_HOME=$HOME/.local/bin
export XDG_TRASH_HOME=$XDG_DATA_HOME/Trash

# ZSH
# compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
export HISTFILE="$XDG_STATE_HOME"/zsh/history

# Wget
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# Discord
export DISCORD_USER_DATA_DIR="${XDG_STATE_HOME}/discord"

# GnuPG
export GNUPGHOME="$XDG_DATA_HOME"/gnupg

# Cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# -------------------------------
# |       Update PATH           |
# -------------------------------
export PATH="$PATH:$XDG_BIN_HOME:$CARGO_HOME/bin"

# Misc environment variables
export GTK_THEME="Catppuccin-Macchiato-Standard-Pink-Dark:dark"

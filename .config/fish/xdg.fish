# -------------------------------
# |      Force XDG Paths        |
# -------------------------------

set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_CACHE_HOME "$HOME/.cache"
set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_BIN_HOME "$HOME/.local/bin"
set -gx XDG_TRASH_HOME "$XDG_DATA_HOME/Trash"

# # ZSH
# compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"
# set -gx HISTFILE="$XDG_STATE_HOME"/zsh/history  

# Wget
set -gx WGETRC "$XDG_CONFIG_HOME/wgetrc"
alias wget "wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\""

# Discord
set -gx DISCORD_USER_DATA_DIR "$XDG_DATA_HOME"

# GnuPG
set -gx GNUPGHOME "$XDG_DATA_HOME"/gnupg

# Cargo
set -gx CARGO_HOME "$XDG_DATA_HOME"/cargo

# GTK2
set -gx GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc

# Java
set -gx _JAVA_OPTIONS Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java

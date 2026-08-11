bindkey -e

# Arrow keys
bindkey '^[[D' backward-char
bindkey '^[[C' forward-char

# Ctrl+Left / Ctrl+Right
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Give Zsh enough time to recognize multi-character escape sequences
KEYTIMEOUT=20

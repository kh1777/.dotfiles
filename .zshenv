# XDG
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"


# dump completions to cache, set history file
export ZSH_COMPDUMP="$XDG_CACHE_HOME/zsh/.zcompdump"
export HISTFILE="$XDG_STATE_HOME/zsh/history"

# Tell zsh where its config is
#export ZDOTDIR="${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

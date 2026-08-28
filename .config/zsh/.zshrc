# Load configs
for file in ~/.config/zsh/*.zsh; do
  [[ -r "$file" ]] && source "$file"
done

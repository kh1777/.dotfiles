# Load shared environment settings.
if [[ -r /workspace/.devtools/scripts/env.sh ]]; then
  source /workspace/.devtools/scripts/env.sh
fi

# Restore certificates before starting the refresh loop.
if [[ -r /workspace/.devtools/scripts/restore-certs.sh ]]; then
  if ! bash /workspace/.devtools/scripts/restore-certs.sh; then
    print -u2 -- "Warning: certificate restoration failed."
  fi
fi

# Start the existing refresh daemon.
# This assumes the daemon itself uses flock to prevent duplicates.
if [[ -x /workspace/.devtools/scripts/refresh-certs-daemon.sh ]]; then
  nohup /workspace/.devtools/scripts/refresh-certs-daemon.sh \
    >/dev/null 2>&1 &!
fi

# Add custom executables to PATH and remove duplicate entries.
typeset -U path
path=("/workspace/.devtools/bin" $path)
export PATH 

# Load other Zsh configurations.
for file in ~/.config/zsh/*.zsh(N); do
  [[ -r "$file" ]] && source "$file"
done

# Apply the working CA settings last so earlier configs cannot override them.
export REQUESTS_CA_BUNDLE=/home/vscode/.certs/azure-combined-ca-bundle.crt
export SSL_CERT_FILE="$REQUESTS_CA_BUNDLE"

if [[ ! -r "$REQUESTS_CA_BUNDLE" ]]; then
  print -u2 -- "Warning: CA bundle is missing: $REQUESTS_CA_BUNDLE"
fi

# Launch Codex with the CA bundle that passed HTTPS verification.
codex() {
  local bundle=/home/vscode/.certs/azure-combined-ca-bundle.crt

  if [[ ! -r "$bundle" ]]; then
    print -u2 -- "Codex CA bundle missing or unreadable: $bundle"
    return 1
  fi

  REQUESTS_CA_BUNDLE="$bundle" \
  SSL_CERT_FILE="$bundle" \
    command codex "$@"
} 

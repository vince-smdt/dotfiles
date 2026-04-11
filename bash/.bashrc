export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

eval "$(starship init bash)"
fastfetch --logo ~/logos/bb.txt --logo-padding-left 2
. "$HOME/.cargo/env"

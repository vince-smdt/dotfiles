[[ $(tty) == /dev/tty1 ]] && exec start-hyprland

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

eval "$(starship init bash)"

fastfetch --logo ~/logos/bb.txt --logo-padding-left 2

. "$HOME/.cargo/env"

if command -v tmux >/dev/null 2>&1 && [ -z "$TMUX" ] && [[ $- == *i* ]] && [[ $(tty) != /dev/tty* ]]; then
    tmux attach-session 2>/dev/null || tmux new-session
fi

export PATH=/home/vince/.opencode/bin:$PATH

eval "$(zoxide init bash)"

# Created by `pipx` on 2026-05-17 19:48:31
export PATH="$PATH:/home/vince/.local/bin"

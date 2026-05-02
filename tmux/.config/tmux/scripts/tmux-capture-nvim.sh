#!/usr/bin/sh

TMPFILE=$(mktemp /tmp/tmux-capture.XXXXXX)
tmux capture-pane -pS - > "$TMPFILE"
tmux new-window "nvim '$TMPFILE' +$ -c 'set buftype=nofile' && rm '$TMPFILE'"

# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

alias gtree='git log --oneline --graph --decorate --all'


# Add your own exports, aliases, and functions here.

# set vi mode always
set -o vi
bind 'set show-mode-in-prompt on'
bind 'set vi-ins-mode-string \1\e[32m\2(ins)\1\e[0m\2 '
bind 'set vi-cmd-mode-string \1\e[33m\2(cmd)\1\e[0m\2 '
# setup tmux dashbord/workspace
function dash() {

    if tmux has-session -t "Work" 2>/dev/null; then
        tmux attach-session -t "Work"
    else
        # 1. Create session and first window (Monitoring)
        tmux new-session -d -s "Work"
        tmux send-keys -t "Work" 'btop' Enter

        tmux split-window -v -p 30
        tmux send-keys -t "Work" 'cd pomodoro' Enter
        tmux send-keys -t "Work" 'cargo run' Enter

        tmux split-window -h

        tmux send-keys -t "Work" 'tty-clock -c -t -s' Enter
        # tmux select-window -t "Work:1"
        # tmux attach-session -t "Work"
        #
        # tmux split-window -h -p 30
        #

    # tmux send-keys -t "Work" 'cbonsai -li'
        #
        # 2. Create second window (Coding/Development)
        tmux new-window -t "Work" -n "TODO"
        tmux send-keys -t "Work" 'nvim work.md' Enter
        
        # 3. Create third window (Logs or Misc)
        tmux new-window -t "Work" -n "Leniar"
        tmux send-keys -t "Work" 'linear-cli issues list --state TODO' Enter


        tmux new-window -t "Work" -n "CODE"

        # Select the 'Dev' window by default on startup
        tmux select-window -t "Work:2"
        tmux attach-session -t "Work"
    fi
}

function spell() {
  codespell --skip="node_modules, target, build, Cargo.lock, package-lock.json"
}
# Make an alias for invoking commands you use constantly
# alias p='python'
. "$HOME/.cargo/env"


# Added by Antigravity CLI installer
export PATH="/home/mgs/.local/bin:$PATH"

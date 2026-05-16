# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
function dash() {

    nohup /home/mgs/setup_computer/kanata --cfg /absolute/path/to/kanata.kbd > /dev/null 2>&1 &
    if tmux has-session -t "Work" 2>/dev/null; then
        tmux attach-session -t "Work"
    else
        # 1. Create session and first window (Monitoring)
        tmux new-session -d -s "Work"
        tmux send-keys -t "Work" 'btop' Enter

        tmux split-window -v -p 30
        tmux send-keys -t "Work" 'cd rust-cli-pomodoro' Enter
        tmux send-keys -t "Work" 'cargo run' Enter

        # tmux select-window -t "Work:1"
        # tmux attach-session -t "Work"
        #
        # tmux split-window -h -p 30
        # tmux send-keys -t "Work" 'cbonsai -li'
        #
        # 2. Create second window (Coding/Development)
        tmux new-window -t "Work" -n "TODO"
        tmux send-keys -t "Work" 'nvim work.md' Enter
        
        # 3. Create third window (Logs or Misc)
        # tmux new-window -t "Work" -n "Leniar"
        # tmux send-keys -t "Work" 'linear-cli issues list --state TODO'
        #

        tmux new-window -t "Work" -n "CODE"

        # Select the 'Dev' window by default on startup
        tmux select-window -t "Work:2"
        tmux attach-session -t "Work"
    fi
}
# Make an alias for invoking commands you use constantly
# alias p='python'
. "$HOME/.cargo/env"

#!/bin/sh

SESSION=baz

tmux new-session -d -s $SESSION

tmux send-keys 'cd ~/Development/bazaruto; nvim' C-m
tmux rename-window 'code'

tmux new-window -t $SESSION
tmux select-window -t $SESSION:1
tmux send-keys 'cd ~/Development/bazaruto; rails s' C-m
tmux split-window -h
tmux send-keys 'cd ~/Development/bazaruto; bundle exec sidekiq -e $RAILS_ENV -q high -q medium -q default' C-m
tmux split-window
tmux send-keys 'cd ~/Development/bazaruto; npm run dev' C-m
tmux rename-window 'server'

tmux new-window -t $SESSION
tmux select-window -t $SESSION:2
tmux send-keys 'cd ~/Development/bazaruto' C-m
tmux rename-window 'bash'

tmux attach -t $SESSION:0

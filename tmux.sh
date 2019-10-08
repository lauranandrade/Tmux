#!/bin/bash
#
SESSION=$1
 
tmux new-session -d -s $SESSION

tmux rename-window "Home - Documents"

#Controler
tmux send-keys bash C-m
tmux send-keys clear C-m
tmux clock

#Home
tmux split-window -h
tmux send-keys bash C-m

#Documents
tmux split-window -v
tmux send-keys bash C-m
tmux send-keys "cd Documents" C-m
tmux send-keys clear C-m

tmux new-window
tmux rename-window "Faculdade"

#Faculade
tmux send-keys bash C-m
tmux send-keys clear C-m
tmux send-keys "cd Documents/PUC/5P" C-m

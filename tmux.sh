#!/bin/bash
#
SESSION=$1
 
tmux new-session -d -s $SESSION

tmux rename-window "Home-Documents"

#Controler
tmux send-keys clear C-m
tmux clock

#Home
tmux split-window -h

#Documents
tmux split-window -v
tmux send-keys "cd ../Documents" C-m
tmux send-keys clear C-m

#Faculdade
tmux new-window
tmux rename-window "Faculdade"
tmux send-keys clear C-m
tmux split-window -h
tmux send-keys clear C-m

tmux attach

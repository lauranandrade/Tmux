#!/bin/bash
#
SESSION=$1
 
tmux new-session -d -s $SESSION

tmux rename-window "Tahiti-Juicer-codeView"

#Controler
tmux send-keys bash C-m
tmux send-keys clear C-m
tmux clock

#Tahiti
tmux split-window -h
tmux send-keys bash C-m
tmux send-keys "cd tahiti" C-m
tmux send-keys "source venv/bin/activate" C-m
tmux send-keys clear C-m
tmux send-keys "PYTHONPATH=. TAHITI_CONFIG=../yaml/tahiti.yaml python tahiti/app.py" C-m

#Juicer
tmux split-window -v
tmux send-keys bash C-m
tmux send-keys "cd juicer" C-m
tmux send-keys "source venv/bin/activate" C-m
tmux send-keys clear C-m
tmux send-keys "PYTHONPATH=. JUICER_CONFIG=../yaml/juicer.yaml python juicer/runner/server.py -c ../yaml/juicer.yaml" C-m

sleep 3 #Espera o tahiti e juicer subirem totalmente

#Juicer code generator
tmux split-window -v
tmux send-keys bash C-m
tmux send-keys "cd juicer" C-m
tmux send-keys "source venv/bin/activate" C-m
tmux send-keys clear C-m
tmux send-keys "#PYTHONPATH=. python juicer/app.py -c ../yaml/juicer.yaml -w 45" C-m

tmux new-window
tmux rename-window "Stand-Minion"

#Controler
tmux send-keys bash C-m
tmux send-keys clear C-m
tmux send-keys "pkill -f minion" C-m

#Stand
tmux split-window -h
tmux send-keys bash C-m
tmux send-keys "cd stand" C-m
tmux send-keys "source venv/bin/activate" C-m
tmux send-keys clear C-m
tmux send-keys "PYTHONPATH=. STAND_CONFIG=../yaml/stand.yaml python stand/app.py" C-m

#Minion
tmux split-window -v
tmux send-keys bash C-m
tmux send-keys "cd juicer" C-m
tmux send-keys "source venv/bin/activate" C-m
tmux send-keys clear C-m
tmux send-keys "pkill -f minion; pkill -SIGINT -f minion; PYTHONPATH=. python juicer/runner/minion.py -c ../yaml/juicer.yaml -w 45 -t scikit-learn" C-m

#Citrus
tmux new-window
tmux rename-window "Citrus-Tensorboard"
tmux send-keys bash C-m
tmux send-keys "cd citrus" C-m
tmux send-keys clear C-m
tmux send-keys "python2 -m SimpleHTTPServer 3001" C-m

#Tensorboard
tmux split-window -h
tmux send-keys bash C-m
tmux send-keys "cd juicer" C-m
tmux send-keys "source venv/bin/activate" C-m
tmux send-keys clear C-m
tmux send-keys "#tensorboard --logdir=/tmp/logs/ --reload_interval=1" C-m

#General controler
tmux new-window
tmux rename-window "Controler"
tmux send-keys bash C-m
tmux send-keys clear C-m
tmux split-window -h
tmux send-keys bash C-m
tmux send-keys clear C-m

tmux attach

#tmux new-window -t $SESSION:1 -n 'System'
#tmux split-window -v
#tmux select-pane -t 1
#tmux split-window -h
 
#tmux select-pane -t 0
#tmux send-keys "dmesg | less" C-m
 
#tmux select-pane -t 1
#tmux send-keys "watch sensors" C-m
 
#tmux select-pane -t 2
 
#tmux new-window -t $SESSION:2 -n 'Build'
#tmux split-window -v
 
#tmux select-pane -t 0
#tmux send-keys "cd /usr/src/linux" C-m
 
#tmux select-pane -t 1
#tmux send-keys "vim /boot/grub/grub.cfg" C-m
 
#tmux select-window -t $SESSION:0

#tmux send-keys "htop" C-m
 
#tmux select-window -t $SESSION:2
#tmux select-pane -t 0
 
#tmux attach-session -t $SESSION

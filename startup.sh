#!/bin/sh

eval $(ssh-agent)
ssh-add ~/.ssh/id_rsa_adacore
ssh-add ~/.ssh/id_rsa_spanners
tmux new -n 'make' -d 'cd ~/spark2014; zsh -i' \; \
  new-window -n 'test' -d 'cd /home/simon/spark2014/testsuite/gnatprove/; zsh -i' \; \
  new-window -n 'U824-022' -d 'cd /home/simon/spark2014/testsuite/gnatprove/tests/U824-022__flow_detect_loop_exit; zsh -i' \; \
  new-window -n 'gps' -d 'cd /home/simon/spark2014/; zsh -i' \; \
  attach \;
exit 0

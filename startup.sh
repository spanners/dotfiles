#!/bin/sh

eval $(ssh-agent)
ssh-add
tmux new -d 'mutt' \; \
  new-window -n 'make' -d 'cd ~/spark2014; zsh -i' \; \
  new-window -n 's2014' -d 'vim /home/simon/spark2014/src/flow/flow.adb +279' \; \
  new-window -n 'test' -d 'cd /home/simon/spark2014/testsuite/gnatprove/tests/S406-003__flow-show-gg; zsh -i' \; \
  new-window -n 'plugin' -d 'cd /home/simon/git/adacore/gps/share/plug-ins; zsh -i' \; \
  attach \;
exit 0

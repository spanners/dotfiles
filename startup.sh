#!/bin/sh

eval $(ssh-agent)
ssh-add
tmux new -d 'neomutt' \; \
  new-window -d 'cd ~/spark2014; zsh -i' \; \
  new-window -d 'vim /home/simon/spark2014/src/flow/flow_generated_globals-phase_2.adb +864' \; \
  new-window -d 'cd ~/spark2014/testsuite/gnatprove/tests/T213-023__flow_unchecked; zsh -i' \; \
  attach \;
exit 0

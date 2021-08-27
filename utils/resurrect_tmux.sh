#!/bin/bash

# get the current resurrect file
fname=$(readlink ~/.tmux/resurrect/last)

# support cmd-line args
while getopts ":ht:" opt; do
  case $opt in
    h)
      echo "Starts and restores the specified tmux session"
      echo "Note: changes the 'last' tmux session to the user specified one."
      echo "      this means future reloads will default to that one"
      echo "Usage: cmd [-h] [-t]"
      echo "  ./resurrect_tmux.sh -h               Display this help msg"
      echo "  ./resurrect_tmux.sh -t <filename>    Restore a tmux session\
 provided by filename (must be in ~/.tmux/resurrect/)
                                       default: $(readlink ~/.tmux/resurrect/last)"
      ;;
    t)
        # echo "-t was triggered, Parameter: $OPTARG" >&2
        fname=$OPTARG.txt
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument." >&2
      exit 1
      ;;
  esac
done

# verify the session to load
echo "loading tmux session: $fname"

# check if tmux is running & start it if not
if [ "$TERM_PROGRAM" = tmux ]; then # only works for tmux >3.2
  echo 'Already In tmux'
else
  echo 'Not in tmux, starting'
  tmux
fi

# change into the resurrection dir
cd ~/.tmux/resurrect/

# link the specified file to the tmux last symlink
ln -sf $fname last

# restore using tmux-resurrect
~/.tmux/plugins/tmux-resurrect/scripts/./restore.sh



# List of Procedures to get Fully Setup


## Step 1:
 - get right version of tmux running so my configs and tmux-resurrect would work
   - `tmux -V` get version
   - we want version >= 1.9
   - [Follow these instructions to install tmux without root](https://www.looklinux.com/how-to-install-tmux-from-source-non-root-user/)

## Step 2:
 - get the vim and tmux confs 
 - copy the .tmux file over from my repo
 - add +x ability to the whole directory (recursively)
 - verify that tmux-continuum works

## Step 3:
 - copy the vim configurations in `.vimrc` and `.vim` folders

## Step 4:
 - update the git
   - grab the latest from https://git-scm.com/download/linux
   - follow the formula from step 1 to install it locally as well
   - `source ~/.bash_profile` to see the changes

## Step 5:
 - [setup miniconda](https://engineeringfordatascience.com/posts/install_miniconda_from_the_command_line/)
 - grab mamba as well `conda install mamba -n base -c conda-forge`
 - 🐍
 - note: we need to add the following line to the bashrc otherwise things we did b4 don't work
   - `export PATH="$HOME/bin:$HOME/.local/bin:$PATH"`
   - before the conda initialization


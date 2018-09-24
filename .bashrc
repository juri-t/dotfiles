# コマンドのエイリアス
alias ls='ls -G'
alias ll='ls -Gl'
alias sed='gsed'
alias python='python3'
alias pip='pip3'

source /usr/local/Cellar/git/2.12.2/etc/bash_completion.d/git-prompt.sh
source /usr/local/Cellar/git/2.12.2/etc/bash_completion.d/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true

# コンソールの表示を見やすく
PS1='\n\[\e[1;32m\]\u@\h \[\e[1;36m\]\w\[\e[1;31m\]$(__git_ps1)\n\[\e[0m\]\$ '

# Macのbashのディレクトリが見づらいのでカラー変更
export LSCOLORS=cxfxcxdxbxegedabagacad
export PYTHONPATH="$HOME/anaconda/lib/python3.6/site-packages:$HOME/git/working_jupyter/lib"

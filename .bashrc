# コマンドのエイリアス
alias ls='ls -G'
alias ll='ls -Gl'
alias sed='gsed'
alias python='python3'
alias pip='pip3'

# コンソールの表示を見やすく
PS1='\n\[\e[36m\][\D{%Y/%M/%d %a} \t] \[\e[1;31m\]\w \n\$\[\e[0m\] '

# Macのbashのディレクトリが見づらいのでカラー変更
export LSCOLORS=cxfxcxdxbxegedabagacad
export PYTHONPATH="$HOME/anaconda/lib/python3.6/site-packages:$HOME/git/working_jupyter/lib"

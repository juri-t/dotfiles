setup: zshrc vimrc npmrc
zshrc:
	ln -sfn $(CURDIR)/.zshrc ~/.zshrc
vimrc:
	ln -sfn $(CURDIR)/.vimrc ~/.vimrc
npmrc:
	ln -sfn $(CURDIR)/.npmrc ~/.npmrc
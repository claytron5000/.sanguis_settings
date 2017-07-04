#!/usr/bin/env bash
P=~/.sanguis_settings

if [ ! -f $P ]
then
  git clone --recursive https://github.com/claytron5000/.sanguis_settings.git $P
  cd $P
else
  cd $P
  git pull
  git submodule --init --recursive
fi
  
if [[ -f "$HOME/.zshrc" ]]; then
  ZSHDATA=`cat ~/.zshrc`
  mv $HOME/.zshrc $HOME/.zshrc_old
  rm $HOME/.zshrc
echo $ZSHDATA >> $P/zshrc
fi


# create symlinks
# todo: add ifs
ln -s $P/.vim $HOME/.vim
ln -s $P/zshrc $HOME/.zshrc
ln -s $P/tmux.conf $HOME/.tmux.conf
ln -s $P/gitconfig $HOME/.gitconfig
ln -s $P/prezto $HOME/.zprezto

update_ss
setup prezto
setopt EXTENDED_GLOB
#for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
#done
source $HOME/.zshrc

if [ ! -d ~/.bash/git-aware-prompt ]; then
  mkdir ~/.bash
  cd ~/.bash
  git clone git://github.com/jimeh/git-aware-prompt.git
fi

if [ ! -f ~/.bashrc ]; then
  ln -s ~/dotfiles/bashrc ~/.bashrc
fi

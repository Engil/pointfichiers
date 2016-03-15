ln -s `pwd`/nvim ~/.config/nvim
cd ~/.config/nvim
git submodule init
git submodule update
cd -
ln -s `pwd`/.zshrc ~/.zshrc
ln -s `pwd`/.tmux.conf ~/.tmux.conf
cd prompt
ocamlbuild -pkg unix prompt.byte
cd ..
mkdir -p ~/local/bin/
cp prompt/prompt.byte ~/local/bin/oprompt

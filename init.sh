ln -s nvim ~/.config/nvim
ln -s .zshrc ~/.zshrc
cd prompt
ocamlbuild -pkg unix prompt.byte
cd ..
mkdir -p ~/local/bin/
cp prompt/prompt.byte ~/local/bin/oprompt

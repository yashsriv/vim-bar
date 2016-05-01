```
__     ___             ____             
\ \   / (_)_ __ ___   | __ )  __ _ _ __ 
 \ \ / /| | '_ ` _ \  |  _ \ / _` | '__|
  \ V / | | | | | | | | |_) | (_| | |   
   \_/  |_|_| |_| |_| |____/ \__,_|_|   
                                        
```
![Screenshot](https://raw.githubusercontent.com/yashsriv/vim-bar/master/vim_photo.png)
# Pun Intended
A Soap for cleaning code.
# Features
* A .vimrc/init.vim which contains a single line of code
* Handles both `vim` and `NeoVim`
* [Vim-Plug](https://github.com/junegunn/vim-plug) plugin manager for asynchronus plugins in NeoVim
* Many Key bindings I love
* Boilerplate code insertion for certain types of files
* All the plugins I use
* Auto commands for certain files
# Installation
It's suggested you view bar.vim and all the other dependency files in the vimbar folder rather than just using this as is  
But for instant comfort,
``` bash
# Backup previous vimrc and vim folder
mv ~/.vim ~/.vim.bak
mv ~/.vimrc ~/.vimrc.bak
# Clone vim folder
git clone https://github.com/yashsriv/vim-bar.git ~/.vim
# For vim
ln -s ~/.vim/init.vim ~/.vimrc
# For NeoVim
ln -s ~/.vim ~/.config/nvim
# For installing all plugins
vim -c "PlugInstall"
# OR you could try
git submodule update

```

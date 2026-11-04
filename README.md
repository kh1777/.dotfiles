# My personal dotfiles
This directory contains the dotfiles for my system

## Requirements 
Ensure you have the following installed on your system
```
git
stow
```

## Installation 
```
$ git clone https://github.com/kh14762/.dotfiles.git 
$ cd .dotfiles
$ stow .
```
## Stow specific dirs
```
stow -nv --dir=/workspace/.dotfiles/.config --target=$HOME/.config herdr 
```
--dir: defines where the files are stowed 
--target: defines where you want to stow the files
-n: dry run
-verbose mode

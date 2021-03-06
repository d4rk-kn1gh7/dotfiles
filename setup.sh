#!/bin/bash

cd ~/dotfiles

sudo dpkg --add-architecture i386 && sudo apt-get update && \
    sudo apt-get install -qy \
    git nasm python \
    build-essential \
    python-dev python-setuptools python3-pip \
    libc6-dbg \
    libc6-dbg:i386 \
    gcc-multilib \
    gdb \
    gcc \
    wget \
    curl \
    ltrace \
    strace \
    cmake \
    python-capstone \
    socat \
    netcat \
    ruby \
    vim \
    tmux \
    zsh \
    libc6:i386 libncurses5:i386 libstdc++6:i386 && \
    sudo apt-get clean

pip3 install --no-cache-dir pwntools && \
    sudo gem install one_gadget

cd ~/ && \
    git clone https://github.com/pwndbg/pwndbg.git && \
    cd ~/pwndbg/ && ./setup.sh

cd ~/dotfiles

bash -c "$(curl -fsSL http://gef.blah.cat/sh)"

cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
cd ~/dotfiles
cp ./.tmux.conf.local ~/.tmux.conf.local 

export RUNZSH=no
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/agkozak/zsh-z ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z

cd ~/dotfiles
cp ./.zshrc ~/.zshrc
cp ./.p10k.zsh ~/.p10k.zsh
cp ./.gdbinit ~/.gdbinit

sudo chsh -s $(which zsh)
zsh

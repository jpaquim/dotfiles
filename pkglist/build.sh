#!/usr/bin/env bash

DIR=$HOME/pkglist

mkdir -p $DIR
pacman -Qq > $DIR/all
pacman -Qqe > $DIR/explicit
pacman -Qqem > $DIR/aur
pacman -Qqen > $DIR/pacman
pacman -Qqet > $DIR/truncated

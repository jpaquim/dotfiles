# dotfiles

My dotfiles, managed with [yadm](https://thelocehiliosan.github.io/yadm/).

# Installation

Install Homebrew:
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install programs from Brewfile:
```
brew bundle
```

Use yadm to clone this repository:
```
yadm clone https://github.com/jpaquim/dotfiles
```

yadm will then offer to bootstrap the system.

# Initial setup
iTerm2 - run the following to load preferences from the included folder:
```
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
```

nvim - will automatically install its plugins on first launch.

tmux - press `prefix + I` to install plugins.

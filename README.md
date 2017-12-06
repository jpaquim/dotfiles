# dotfiles

My dotfiles, managed with [yadm](https://thelocehiliosan.github.io/yadm/).

# Installation

Install yadm with Homebrew:
```
brew install yadm
```

Or manually download it:
```
curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm
```

Use yadm to clone this repository:
```
yadm clone https://github.com/jpaquim/dotfiles
```

yadm will then offer to bootstrap the system.

# Initial setup
nvim - will automatically install its plugins on first launch.

tmux - press `prefix + I` to install plugins.

iTerm2 - run the following to load preferences from the included folder:
```
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
```

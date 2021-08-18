# dotfiles

My dotfiles, managed with [yadm](https://yadm.io/).

# Installation

Download yadm and use it to clone this repository and bootstrap the system:
```sh
# with curl if available
curl -fsSL https://github.com/thelocehiliosan/yadm/raw/master/yadm | bash -s clone --recurse-submodules https://github.com/jpaquim/dotfiles
# otherwise with wget
wget -O - https://github.com/thelocehiliosan/yadm/raw/master/yadm | bash -s clone --recurse-submodules https://github.com/jpaquim/dotfiles
```

## macOS
Ensure that the Xcode Command Line Tools are installed. Otherwise, run:

```sh
xcode-select --install
```

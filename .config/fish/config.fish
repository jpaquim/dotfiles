# Disable the default greeting
set fish_greeting

# Override system locale for consistency
set -gx LC_ALL en_US.UTF-8

# Set system-wide editor to neovim
set -gx EDITOR nvim

# local binaries
fish_add_path $HOME/bin

# pnpm
set -gx PNPM_HOME $HOME/.local/share/pnpm
fish_add_path $PNPM_HOME

# ccache
if command -q ccache
  fish_add_path /usr/lib/ccache/bin
end

# Rust packages
if command -q cargo
  fish_add_path $HOME/.cargo/bin
end

# Use sccache as rustc wrapper if available
if command -q sccache
  set -gx RUSTC_WRAPPER (which sccache)
end

# Commands to run in interactive sessions can go here
if status is-interactive
  # Aliases
  alias g git

  alias ls "ls --color=auto -F"

  if command -q yay
    alias update "yay"
  else if command -q pacman
    alias update "sudo pacman -Syu"
  else if command -q apt
    alias update "sudo apt update && sudo apt upgrade"
  else if command -q brew
    alias update "brew update && brew upgrade && brew cleanup"
  end
  # alias update-all "update && rustup update"

  # macOS-like aliases for clipboard access
  if command -q pbcopy
    alias clcopy "pbcopy"
    alias clpaste "pbpaste"
  else if test -n $WAYLAND_DISPLAY
    alias clcopy "wl-copy"
    alias clpaste "wl-paste"
  else
    alias clcopy "xsel -ib"
    alias clpaste "xsel -ob"
  end

  # use bat instead of cat if available
  if command -q bat
    alias cat bat
  else if command -q batcat
    alias cat batcat
  end

  if test -n $WAYLAND_DISPLAY
    alias code "code --enable-features=UseOzonePlatform --ozone-platform=wayland"
  end

  # jq aliases to get package.json fields
  if command -q jq
    alias deps "jq .dependencies package.json | jq keys[]"
    alias depsv "jq .dependencies package.json"
    alias devdeps "jq .devDependencies package.json | jq keys[]"
    alias devdepsv "jq .devDependencies package.json"
    alias scripts "jq .scripts package.json"
    alias version "jq .version package.json"
  end
  
  # connect to a VM on localhost:8022
  alias vm 'ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -q -p 8022 localhost'
  # alias vm 'ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=QUIET -p 8022 localhost'
end

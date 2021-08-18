# Disable the default greeting
set fish_greeting

# Override system locale for consistency
set -gx LC_ALL en_US.UTF-8

# Override system locale for consistency
set -gx EDITOR nvim

# local binaries
fish_add_path $HOME/bin

# ccache
fish_add_path /usr/lib/ccache/bin

# asdf
if command -q asdf
  source /opt/asdf-vm/asdf.fish
end

# PostgreSQL
fish_add_path /Applications/Postgres.app/Contents/Versions/latest/bin

# Dart packages
fish_add_path $HOME/.pub-cache/bin

# Java OpenJDK keg-only
fish_add_path /usr/local/opt/openjdk/bin

# Rust packages
fish_add_path $HOME/.cargo/bin

if command -q sccache
  set -gx RUSTC_WRAPPER (which sccache)
end

# Aliases
alias g git
if command -q yay
  alias update "yay"
else if command -q pacman
  alias update "sudo pacman -Syu"
else if command -q brew
  alias update "brew update && brew upgrade && brew cleanup"
end
# alias update-all "update && rustup update"

# jq aliases to get package.json fields
alias deps "jq .dependencies package.json | jq keys[]"
alias depsv "jq .dependencies package.json"
alias devdeps "jq .devDependencies package.json | jq keys[]"
alias devdepsv "jq .devDependencies package.json"
alias scripts "jq .scripts package.json"
alias version "jq .version package.json"

if command -q bat
  alias cat bat
else if command -q batcat
  alias cat batcat
end

if ! command -q pbcopy
  alias pbcopy "xsel -ib"
end
if ! command -q pbpaste
  alias pbpaste "xsel -ob"
end

if test -n $WAYLAND_DISPLAY
  alias code "code --enable-features=UseOzonePlatform --ozone-platform=wayland"
  alias chrome "google-chrome-unstable --incognito --enable-features=UseOzonePlatform --ozone-platform=wayland"
  # --enable-vulkan --enable-unsafe-webgpu
end

alias vm 'ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -q -p 8022 localhost'
# alias vm 'ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o LogLevel=QUIET -p 8022 localhost'

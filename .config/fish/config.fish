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
source /opt/asdf-vm/asdf.fish

# PostgreSQL
fish_add_path /Applications/Postgres.app/Contents/Versions/latest/bin

# Dart packages
fish_add_path $HOME/.pub-cache/bin

# Java OpenJDK keg-only
fish_add_path /usr/local/opt/openjdk/bin

# Rust packages
fish_add_path $HOME/.cargo/bin

set -gx RUSTC_WRAPPER (which sccache)

# Aliases
alias g git
alias update "brew update && brew upgrade && brew cleanup"
alias update-all "update && rustup update"

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

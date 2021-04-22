# Disable the default greeting
set fish_greeting

# Override system locale for consistency
set -gx LC_ALL en_US.UTF-8

# Override system locale for consistency
set -gx EDITOR nvim

# PostgreSQL
fish_add_path /Applications/Postgres.app/Contents/Versions/latest/bin

# Dart packages
fish_add_path $HOME/.pub-cache/bin

# Rust packages
fish_add_path $HOME/.cargo/bin

set -gx RUSTC_WRAPPER /usr/local/bin/sccache

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

alias cat bat

# Disable the default greeting
set fish_greeting

# Override system locale for consistency
set -gx LC_ALL en_US.UTF-8

# PostgreSQL
set -gx PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

# Dart packages
set -gx PATH /Users/jpaquim/.pub-cache/bin $PATH

# Aliases
alias g "git"

# jq aliases to get package.json fields
alias deps "jq .dependencies package.json | jq keys[]"
alias depsv "jq .dependencies package.json"
alias scripts "jq .scripts package.json"
alias version "jq .version package.json"

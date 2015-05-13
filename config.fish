# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme bobthefish
set -g theme_display_ruby no
set -g default_user your_normal_user

# All built-in plugins can be found at ~/.oh-my-fish/plugins/
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Enable plugins by adding their name separated by a space to the line below.
set fish_plugins theme git-flow rails rvm

# Path to your custom folder (default path is ~/.oh-my-fish/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# Use 256 colours
set -x TERM xterm-256color

# Hide the fish greeting
function fish_greeting
end

# Hide the right prompt
function fish_right_prompt
end

# psql
set PATH /Applications/Postgres.app/Contents/Versions/9.4/bin $PATH

# business_app
set -x SAURON_API_URL http://go2africa:UatBuHacAfv9UgR9@eye-master.go2africa.com
set -x RAILS_ENV development
set -x SIDEKIQ_DB_POOL 25
set -x DB_POOL 5
set -x LOG_LEVEL debug

# Phoenix aliases
function phoenix
    mix phoenix.server
end

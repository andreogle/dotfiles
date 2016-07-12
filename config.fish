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

# RVM path
set PATH /Users/andreogle/.rvm/gems/ruby-2.3.0/bin $PATH
rmv default

# psql
set PATH /Applications/Postgres.app/Contents/Versions/9.4/bin $PATH

# business_app
set -x RAILS_ENV development
set -x SIDEKIQ_DB_POOL 25
set -x DB_POOL 5
set -x LOG_LEVEL debug
set -x SIDEKIQ_CONCURRENCY 25

# Phoenix aliases
function phoenix
    mix phoenix.server
end

# boot2docker
set -x DOCKER_CERT_PATH /Users/andreogle/.boot2docker/certs/boot2docker-vm
set -x DOCKER_TLS_VERIFY 1
set -x DOCKER_HOST tcp://192.168.59.103:2376

# Load other secret keys
. ./keys.fish

# Cucumber
set -x LOCAL_CUKE true

# Ansible
set -x ANSIBLE_HOSTS /etc/ansible/hosts

# Thefuck
eval (thefuck --alias | tr '\n' ';')

# NVM
set -x NVM_DIR "$HOME/.nvm"
source ~/.config/fish/nvm-wrapper/nvm.fish


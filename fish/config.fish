set fish_greeting

function cpp_clean
  command rm -rf ./a.out ; g++ $argv ; ./a.out
end

function ts_clean
  command rm -rf ./$argv.js ; yarn tsc ; node $argv.js
end

function push_all
  command git add . && git commit -m $argv && git push
end

function develop-select
  command bash /home/abdiel/scripts/zellij/list-sessions.sh
end
function develop-last
  command bash /home/abdiel/scripts/zellij/attach-last-session.sh
end
function develop-new
  command zellij
end

alias vim='nvim'
alias l='exa'
alias la='exa -a'
alias ll='exa -lah'
alias ls='exa --color=auto'
alias z='zoxide'
alias emulator='~/Android/Sdk/emulator/emulator'
alias image='nsxiv'

zoxide init fish | source
set -x DENO_INSTALL "/home/abdiel/.deno"
set -x PATH "$DENO_INSTALL/bin:$PATH"
export ANDROID_SDK=/home/abdiel/Android/Sdk
export GTK_USE_PORTAL=0
export NODE_OPTIONS=--max_old_space_size=4096
export N_PREFIX=$HOME/.n
export NEXTCLOUD_DATADIR="/mnt/large/nextcloud"
export FLYCTL_INSTALL="/home/abdiel/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"


fish_add_path /var/lib/snapd/snap/bin/
fish_add_path ~/.emacs.d/bin/
fish_add_path /snap/bin/
fish_add_path ~/.dvm/bin
fish_add_path ~/.deno/bin
fish_add_path ~/Standalone_Apps/heroku/bin
fish_add_path ~/Standalone_Apps/
fish_add_path ~/.deta/bin
fish_add_path ~/lua-language-server/bin
fish_add_path ~/.local/share/pnpm/
fish_add_path ~/.npm-global/bin
fish_add_path ~/.nvim/bin
fish_add_path ~/.bun/bin
fish_add_path ~/.n/bin
fish_add_path /usr/local/go/bin
fish_add_path ~/go/bin
fish_add_path ~/zellij/
fish_add_path ~/skim/bin


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

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

alias vim='nvim'
alias l='exa'
alias la='exa -a'
alias ll='exa -lah'
alias ls='exa --color=auto'
alias z='zoxide'
alias emulator='~/Android/Sdk/emulator/emulator'

zoxide init fish | source
set -x DENO_INSTALL /Users/YOUR_USER/.deno
set -x PATH $DENO_INSTALL/bin:$PATH
export ANDROID_SDK=/home/abdiel/Android/Sdk
fish_add_path /var/lib/snapd/snap/bin/
fish_add_path ~/.emacs.d/bin/
fish_add_path /snap/bin/
fish_add_path ~/.dvm/bin
fish_add_path ~/.deno/bin
fish_add_path ~/Standalone_Apps/heroku/bin
fish_add_path ~/Standalone_Apps/
fish_add_path ~/.deta/bin
fish_add_path ~/lua-language-server/bin

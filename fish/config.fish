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
alias image='nsxiv'

zoxide init fish | source
set -x DENO_INSTALL /Users/YOUR_USER/.deno
set -x PATH $DENO_INSTALL/bin:$PATH
export ANDROID_SDK=/home/abdiel/Android/Sdk
export GTK_USE_PORTAL=0
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

bash ~/scripts/sway-startup.sh


# pnpm
set -gx PNPM_HOME "/home/abdiel/.local/share/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

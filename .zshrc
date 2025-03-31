

# export PATH=$HOME/opt/homebrew/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

#export PATH="$HOME/opt/homebrew/opt/curl/bin:$PATH"

export PATH=$HOME/usr/local/bin:$PATH

#export PATH="$HOME/opt/homebrew/opt/postgresql@16/bin:$PATH"
#export PATH="$HOME/opt/homebrew/opt/sqlite/bin:$PATH"

#export PATH="$HOME/opt/homebrew/opt/openjdk@17/bin:$PATH"
#export CPPFLAGS="-I$HOME/opt/homebrew/opt/openjdk@17/include"

export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/.rbenv/versions/3.4.2/bin:$PATH"
eval "$(rbenv init - --no-rehash zsh)"

export PATH="/Applications/Xcode.app/Contents/Developer/usr/bin:$PATH"

setopt PROMPT_SUBST
function ppt_dir(){
    local f_pwd="${PWD//$HOME/~}"
    #    echo "\e[38;5;37m$f_pwd\e[0m"
    PROMPT=$'\n'"%F{37}$f_pwd%f"$'\n$ '
}
precmd() {
    ppt_dir
}


alias mh='cat ~/.zshrc'

alias la='ls -la --color'
alias cdb='cd ../'

alias gpn='git push -u origin'
alias g='git'
alias gcn='git commit --allow-empty -m "create branch"'
alias ginit='git init'
alias gsw='git switch'
alias gs='git status'
alias gmain='git switch main'
alias gpl='git pull'
alias gps='git push'
alias gf='git fetch'
alias gb='git branch'
alias gl='git log'
alias ga='git add'
alias gc='git commit'

alias lz='source ~/.zshrc'

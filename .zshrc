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

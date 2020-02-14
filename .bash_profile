source "$HOME/.bashrc"

export PATH="/usr/local/bin:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/usr/local/bin/heroku:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/Cellar/git/2.24.1/bin:$PATH"
export PATH="/usr/local/Cellar/r/3.6.2/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.nodebrew/current/bin:$PATH"

export JAVA_HOME="/usr/libexec/java_home -v 1.8"
export EDITOR="vim"
export HISTTIMEFORMAT="%y/%m/%d %T "
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=20000
export PROMPT_COMMAND="history -a; history -c; history -r"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

# ld: library not found for -lssl
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(nodenv init -)"

# bash completion
source /usr/local/Cellar/git/2.24.1/etc/bash_completion.d/git-completion.bash
export PS1="\n\[\033[35m\]\w\[\033[36m\]\$(parse_git_branch)\[\033[00m\] : "
GIT_PS1_SHOWDIRTYSTATE=true

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}


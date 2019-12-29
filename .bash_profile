source "$HOME/.bashrc"

export PATH="/usr/local/bin:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/usr/local/opt/qt/bin:$PATH"
export PATH="/usr/local/bin/heroku:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/sphinx-doc/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/Cellar/r/3.6.1_1/bin:$PATH"
export PATH="/usr/local/Cellar/git/2.24.1/bin/:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"

export EDITOR="vim"
export NVM_DIR="${XDG_CONFIG_HOME/:-$HOME/.}nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export HISTTIMEFORMAT="%y/%m/%d %T "
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=2000
export PROMPT_COMMAND="history -a; history -c; history -r"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export RSTUDIO_WHICH_R="/usr/local/Cellar/r/3.6.0_2/bin/r"

# ld: library not found for -lssl
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
eval "$(nodenv init -)"

# bash completion
source /usr/local/Cellar/git/2.24.1/etc/bash_completion.d/git-completion.bash
PS1="\[\033[35m\]\u:\t \W $\[\033[0m\]"
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
export JAVA_HOME="/usr/libexec/java_home -v 1.8"
export PATH="$HOME/.nodebrew/current/bin:$PATH"


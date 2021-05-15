source "$HOME/.env"

export PATH="/usr/local/bin:$PATH"
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/mysql-client@5.7/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/mysql@5.7/lib"
export CPPFLAGS="-I/usr/local/opt/mysql@5.7/include"
export PKG_CONFIG_PATH="/usr/local/opt/mysql@5.7/lib/pkgconfig"
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export JAVA_HOME='/usr/libexec/java_home -v 1.8'

export EDITOR="nvim"
export HISTTIMEFORMAT="%y/%m/%d %T "
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=20000
export PROMPT_COMMAND="history -a; history -c; history -r"

GIT_PS1_SHOWDIRTYSTATE=false
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=false
GIT_PS1_SHOWUPSTREAM=auto

eval "$(direnv hook zsh)"

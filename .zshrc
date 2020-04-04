alias ls='ls -FGlA'
alias mv='mv -i'
alias rm='rm -i'
alias h='history'
alias pip='pip3'
alias python='python3'

# git completion for zsh
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
autoload -U compinit
compinit -u

# customize prompt
# autoload -Uz colors colors
if [ -f ${HOME}/.zsh/git-completion.zsh ]; then
        zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
fi
source '/usr/local/etc/bash_completion.d/git-prompt.sh'
setopt PROMPT_SUBST ; PS1='%~$(__git_ps1 " (%s)") \$ '

alias ls='ls -FGlA'
alias mv='mv -i'
alias rm='rm -i'
alias h='history -E 1'
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
setopt PROMPT_SUBST ; PS1='%F{magenta}%~%F{cyan}$(__git_ps1 " (%s)") %f\$ '

eval "$(rbenv init -)"
eval "$(nodenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tamai.ayumi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tamai.ayumi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tamai.ayumi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tamai.ayumi/google-cloud-sdk/completion.zsh.inc'; fi

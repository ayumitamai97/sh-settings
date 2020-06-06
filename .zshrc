export PATH="$HOME/.rbenv/bin:$PATH"
if [ -d $HOME/.rbenv/shims ]; then export PATH="$HOME/.rbenv/shims:$PATH"; fi
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export XDG_CONFIG_HOME=$HOME/.config

alias ls='ls -FGlA'
alias mv='mv -i'
alias rm='rm -i'
alias h='history -E 1'
alias pip='pip3'
alias python='python3'
alias vim='nvim'
if command -v pbcopy; then
	:
else
	alias pbcopy='xsel --clipboard --input'
fi

# git completion for zsh
if command -v brew; then
	fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
	autoload -U compinit
	compinit -u
fi

# customize prompt
# autoload -Uz colors colors
if [ -f ${HOME}/.zsh/git-completion.zsh ]; then
        zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.zsh
fi

if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
        source '/usr/local/etc/bash_completion.d/git-prompt.sh'
elif [ -f /etc/bash_completion.d/git-prompt ]; then
        source '/etc/bash_completion.d/git-prompt'
fi
setopt PROMPT_SUBST ; PS1='%F{magenta}%~%F{cyan}$(__git_ps1 " (%s)") %f'

eval "$(rbenv init -)"
eval "$(nodenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tamai.ayumi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tamai.ayumi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tamai.ayumi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tamai.ayumi/google-cloud-sdk/completion.zsh.inc'; fi

function chpwd() { echo -ne "\033]0;$(pwd | rev | awk -F \/ '{print "/"$1"/"$2}'| rev)\007"}

# fzfのkey bindingとEmacs風のkey bindingとの共存
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias ls='ls -FGlA'
alias mv='mv -i'
alias rm='rm -i'
alias ging='cd ~/s/g'
alias h='history'
alias pip='pip3'
alias python='python3'

# Control-w でスラッシュを区切り文字とする
stty werase undef
bind '"\C-w": unix-filename-rubout'

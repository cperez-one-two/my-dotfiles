PROMPT="%(?..[%F{9}%?%f]) %B%F{13}%25<..<%~%f%b %F{10}$%f "

# Completion style
autoload -U compinit && compinit
zstyle ':completion:*' menu select

# PATH additions
# Doom emacs utils
PATH="$HOME/.emacs.d/bin:$PATH"

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Aliases
alias \
	la="lsd -Al" \
	mkd="mkdir -p" \
	v="vim" \
	conf="cd $HOME/.config" \
	home="cd $HOME"

# zsh-z: for fast cd'ing


PROMPT="%(?..[%F{9}%?%f]) %B%F{13}%25<..<%~%f%b %F{10}$%f "

# Completion style
autoload -U compinit && compinit
zstyle ':completion:*' menu select

# PATH additions
# Doom emacs utils
PATH="$HOME/.emacs.d/bin:$PATH"
# User scripts
PATH="$HOME/.local/bin:$PATH"

# Vi mode
bindkey -v
export KEYTIMEOUT=1
# Change cursor shape for different vi modes.
function zle-keymap-select {
	# Solid Block
	if [[ ${KEYMAP} == vicmd ]] ||
		[[ $1 = 'block' ]]; then
		echo -ne '\e[2 q'
	# Blinking Block
	elif [[ ${KEYMAP} == main ]] ||
		[[ ${KEYMAP} == viins ]] ||
		[[ ${KEYMAP} = '' ]] ||
		[[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Aliases
alias \
	la="lsd -Al" \
	mkd="mkdir -p" \
	v="nvim" \
	nv="nvim" \
	vi="vim" \
	conf="cd $HOME/.config" \
	home="cd $HOME"

# Fast Node Manager (fnm)
eval "$(fnm env)"

# Plugins
# zsh-z: for fast cd'ing
source ~/my-dotfiles/.macos/zsh/plugins/zsh-z/zsh-z.plugin.zsh
# fsh
source ~/my-dotfiles/.macos/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

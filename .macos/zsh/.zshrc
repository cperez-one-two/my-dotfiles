#PROMPT='%(?..[%F{9}%?%f]) %B%F{13}%25<..<%~%f%b
#%F{10}$%f '

# git info for prompt
autoload -U colors && colors
autoload -Uz vcs_info
precmd() {
	vcs_info
}
setopt prompt_subst

# pipes
#PROMPT='%(?.%F{8}┏━━%f.%F{8}┏━━[%f%F{9}✗ %?%f%F{8}]━━%f)%F{8}[%f%F{7} %n%f%F{8}]━━[%f%F{13} %3~%f%F{8}]%f${vcs_info_msg_0_}
#%F{8}┗%f%F{12}→%f '
#zstyle ':vcs_info:git:*' formats '%F{8}━━[%f%F{3} %b%f%F{8}]%f'

# simple mac
PROMPT='%(?..%F{red}✗ %? %f)%b%B%F{14}%n%f%b at %B%F{green}%m%f%b in %B%F{magenta}%3~%f%b ${vcs_info_msg_0_}%b
%F{blue}%#%f '
zstyle ':vcs_info:git:*' formats 'on %B%F{yellow}%b%f'

# icons
#PROMPT='%B%(?..%F{9}✗ %? %f)%F{13} %3~ %f${vcs_info_msg_0_}
#%F{12}>%f%b '
#zstyle ':vcs_info:git:*' formats '%F{3} %b%f'

#PROMPT='%(?..%F{9}✗ %? %f)%F{7} %n%f %F{13} %3~%f ${vcs_info_msg_0_}
#%F{12}λ%f '
#zstyle ':vcs_info:git:*' formats '%F{3} %b%f'

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
		echo -ne '\e[3 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[3 q"
}
zle -N zle-line-init
echo -ne '\e[3 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[3 q' ;} # Use beam shape cursor for each new prompt.

# Aliases
alias \
	ls="lsd" \
	la="lsd -A" \
	lla="lsd -Al" \
	lt="lsd --tree" \
	lat="lsd -A --tree" \
	mkd="mkdir -p" \
	v="nvim" \
	nv="nvim" \
	vi="vim"


gman() {
	man $1 | grep -- $2
}

# Fast Node Manager (fnm)
eval "$(fnm env)"

# Plugins
# zsh-z: for fast cd'ing
source ~/my-dotfiles/.macos/zsh/plugins/zsh-z/zsh-z.plugin.zsh
# fsh
source ~/my-dotfiles/.macos/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

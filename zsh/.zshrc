#
# Uhoh's Zoomer Shell
#
# Colors and prompt
autoload -U colors && colors	  # Load colors
PS1="%(?..[%B%F{9}%?%f%b]) %B%F{13}%25<..<%~%f%b %F{10}$%f "
#PS1="%B%{$fg[yellow]%}%n %{$fg[magenta]%}%15<..<%~ %{$fg[green]%}$%b "
setopt autocd                   # cd into directory just by typing it
stty stop undef                 # Disable C-s to freeze terminal
unsetopt BEEP                   # Disable that HORRIBLE beep

# History settings
HISTFILE=~/.cache/zsh/history
HISTSIZE=100000
SAVEHIST=100000

# Source aliases
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Auto/tab complete
autoload -Uz compinit
_comp_options+=(globdots)               # Include hidden files.
fpath+=~/.config/zsh/completions/_fnm   # fnm completions
compinit


# Keybinds
bindkey '^[[P' delete-char                      # Delete key fix
bindkey -s '^f' 'cd "$(dirname "$(fzf)")"\n'    # fzf

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[2 q';;      # Solid Block
        viins|main) echo -ne '\e[1 q';; # Blinking Block
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    echo -ne "\e[1 q"
}
zle -N zle-line-init
echo -ne '\e[1 q'                       # Use beam shape cursor on startup.
preexec() { echo -ne '\e[1 q' ;}        # Use beam shape cursor for each new prompt.

# fnm
eval "`fnm env`"


# direnv
eval "$(direnv hook zsh)"

# Plugins
# zsh-fast-syntax-highlighting
#source ~/.config/zsh/plugins/
# zsh-z :: Fast cd'ing into folders
#source ~/.config/zsh/plugins/

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/home/uhoh/.local/sdkman/bin/sdkman-init.sh" ]] && source "/home/uhoh/.local/sdkman/bin/sdkman-init.sh"

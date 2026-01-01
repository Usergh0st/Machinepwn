# ==========================================================================
#               __              
# .-----.-----.|  |--.----.----.
# |-- __|__ --||     |   _|  __|
# |_____|_____||__|__|__| |____|
#     __         __     __              
# .--|  |.-----.|  |--.|__|.---.-.-----.
# |  _  ||  -__||  _  ||  ||  _  |     |
# |_____||_____||_____||__||___._|__|__|

# Author: Usergh0st
# Repository: https://github.com/Usergh0st/Machinepwn.git
# Mail:	usergh0stmail@proton.me

# Edit this file settings to adjust it your way, user hack the world.
# Depends: eza zsh zsh-syntax-highlighting zsh-autosuggestions scrub fzf
# 31.12.2025 9:41 AM
# =========================================================================

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

#  ___ ___ _______ ______ _______ 
# |   |   |   _   |   __ \     __|
# |   |   |       |      <__     |
#  \_____/|___|___|___|__|_______|
# Other things, export.

export LIBGL_ALWAYS_SOFTWARE=1
export VISUAL="${EDITOR}"
export EDITOR='nvim'
export BROWSER='firefox'
export SUDO_PROMPT="Implementando acceso root para %u 👻➜ "
export BAT_THEME="base16"

#         __ __
# .---.-.|  |__|.---.-.-----.-----.-----.
# |  _  ||  |  ||  _  |__ --|  -__|__ --|
# |___._||__|__||___._|_____|_____|_____|
# Specific command shortcuts for debian/kali.

alias image="kitty +kitten icat"
alias btw="fastfetch"
alias ping="ping -c 1 8.8.8.8 ; ping -c 1 google.es"
alias cls="clear"
alias clsram="sudo sync && sudo sysctl -w wm.drop_caches=3"
alias update="sudo apt update ; clear ; apt list --upgradable ; sudo apt full-upgrade"
alias cacheft="fc-cache -fv"
alias aptche="sudo apt autoremove --purge"
alias vi="nvim"
alias na="nano"
alias settarget="target.sh"
alias cleartarget="target.sh reset"

alias ls="eza --icons=always --color=always -a"
alias ll="eza --icons=always --color=always -la"

alias cat="batcat --theme=base16"
alias catn="batcat --theme=base16 --style=plain"
alias catnp="batcat --theme=base16 --style=plain --paging=never"

#  __     __         __
# |  |--.|__|.-----.|  |_.-----.----.--.--.
# |     ||  ||__ --||   _|  _  |   _|  |  |
# |__|__||__||_____||____|_____|__| |___  |
#                                   |_____|
# History of commands used in zsh only 400.

export HISTORY_IGNORE="(sudo su|cat|ll|ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

HISTFILE=~/.zsh_history
HISTSIZE=400
SAVEHIST=400
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#  _______ _______ _______ _______ _______ _______ 
# |    ___|    |  |     __|_     _|    |  |    ___|
# |    ___|       |    |  |_|   |_|       |    ___|
# |_______|__|____|_______|_______|__|____|_______|
# Load some themes, settings, and other things.

autoload -U compinit ; compinit
local zcompdump="${HOME}/.config/zsh/zcompdump"

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)

zstyle ':completion:*:git-checkout:*' sort true
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list \
		'm:{a-zA-Z}={A-Za-z}' \
		'+r:|[._-]=* r:|=*' \
		'+l:|=*'

zstyle ':vcs_info:*' formats ' %B%s-[%F{magenta}%f %F{yellow}%b%f]-'
zstyle ':fzf-tab:*' fzf-flags --style=full --height=50% --pointer '❱' \
                --color 'pointer:green:bold,bg+:-1:,fg+:green:bold,info:blue:bold,marker:yellow:bold,hl:gray:bold,hl+:yellow:bold' \
                --input-label ' 󰍉  ' --color 'input-border:blue,input-label:blue:bold' \
                --list-label ' 󰕆  ' --color 'list-border:green,list-label:green:bold' \
                --preview-label ' 󰛐  ' --color 'preview-border:magenta,preview-label:magenta:bold'

zstyle ':fzf-tab:complete:eza:*' fzf-preview 'eza -1 --icons=always --color=always -a ${realpath}'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always -a ${realpath}'
zstyle ':fzf-tab:complete:batcat:*' fzf-preview 'batcat --color=always --theme=base16 --style=plain ${realpath}'
zstyle ':fzf-tab:*' fzf-bindings 'space:accept'
zstyle ':fzf-tab:*' accept-line enter

#         __               __
# .-----.|  |.--.--.-----.|__|.-----.-----
# |  _  ||  ||  |  |  _  ||  ||     |__ --|
# |   __||__||_____|___  ||__||__|__|_____|
# |__|             |_____|
# Plugins to use in the zsh for debian/kali
# If not exist, print errors msg.

if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
	source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
	echo "Not found: /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
	source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
else
	echo "Not found: /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

if [ -f /usr/share/zsh-sudo/sudo.plugin.zsh ]; then
	source /usr/share/zsh-sudo/sudo.plugin.zsh
else
	echo "Not found: /usr/share/zsh-sudo/sudo.plugin.zsh"
fi

if [ -f /usr/share/fzf-tab/fzf-tab.plugin.zsh ]; then
	source /usr/share/fzf-tab/fzf-tab.plugin.zsh
else
	echo "Not found: /usr/share/fzf-tab/fzf-tab.plugin.zsh"
fi

#               __                      __   __
# .-----.-----.|  |--.    .-----.-----.|  |_|__|.-----.-----.-----.
# |-- __|__ --||     |    |  _  |  _  ||   _|  ||  _  |     |__ --|
# |_____|_____||__|__|    |_____|   __||____|__||_____|__|__|_____|
#                               |__|
# zsh cool options.

setopt AUTOCD
setopt PROMPT_SUBST
setopt MENU_COMPLETE
setopt LIST_PACKED
setopt AUTO_LIST
setopt COMPLETE_IN_WORD

#  _______                    __   __
# |    ___|.--.--.-----.----.|  |_|__|.-----.-----.-----.
# |    ___||  |  |     |  __||   _|  ||  _  |     |__ --|
# |___|    |_____|__|__|____||____|__||_____|__|__|_____|
# Functions with zshrc

function rmk () {
	scrub -p dod $1
	shred -zun 5 -v $1
}

#  _______ _______ _______      _______ _______ _______ _______ _______ 
# |_     _|   |   |    ___|    |_     _|   |   |    ___|   |   |    ___|
#   |   | |       |    ___|      |   | |       |    ___|       |    ___|
#   |___| |___|___|_______|      |___| |___|___|_______|__|_|__|_______|
# The theme is powerlevel10k

if [ -f /usr/share/powerlevel10k/powerlevel10k.zsh-theme ]; then
	source /usr/share/powerlevel10k/powerlevel10k.zsh-theme
else
	echo "Not found: /usr/share/powerlevel10k/powerlevel10k.zsh-theme"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

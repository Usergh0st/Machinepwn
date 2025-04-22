#               __              
# .-----.-----.|  |--.----.----.
# |-- __|__ --||     |   _|  __|
# |_____|_____||__|__|__| |____|

# Author:	    Usergh0st
# Repository: 	https://github.com/Usergh0st/Machinepwn.git
# Rechme: 	    phoneghost88@gmail.com

# Confusion of the zshrc, shortcuts and other things, focused on pentesting and more.
# Edit this setting to adjust it your way, user hacks the world.

# Depends: eza zsh zsh-syntax-highlighting zsh-autosuggestions aur/scrub

# If not running interactively, don't do anything.
[[ $- != *i* ]] && return

# Use software rendering.
export LIBGL_ALWAYS_SOFTWARE=1

#         __ __                          
# .---.-.|  |__|.---.-.-----.-----.-----.
# |  _  ||  |  ||  _  |__ --|  -__|__ --|
# |___._||__|__||___._|_____|_____|_____|

# Specific command shortcuts.

alias cacheft="fc-cache -fv"
alias update="sudo pacman -Syu --noconfirm"
alias ping="ping -c 1 8.8.8.8 ; ping -c 1 google.es"
alias ls="eza --icons=always --color=always -a"
alias ll="eza --icons=always --color=always -la" 

#  __     __         __                    
# |  |--.|__|.-----.|  |_.-----.----.--.--.
# |     ||  ||__ --||   _|  _  |   _|  |  |
# |__|__||__||_____||____|_____|__| |___  |
#                                   |_____|

# History of commands used in zsh only 500.

export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"

HISTFILE=~/.zhistory
HISTSIZE=500
SAVEHIST=500
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

#         __               __              
# .-----.|  |.--.--.-----.|__|.-----.-----.
# |  _  ||  ||  |  |  _  ||  ||     |__ --|
# |   __||__||_____|___  ||__||__|__|_____|
# |__|             |_____|                 

# Plugins to use in the zsh.

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh

#  _______                    __   __                    
# |    ___|.--.--.-----.----.|  |_|__|.-----.-----.-----.
# |    ___||  |  |     |  __||   _|  ||  _  |     |__ --|
# |___|    |_____|__|__|____||____|__||_____|__|__|_____|

# Undetectable erasure inspired by s4vitars
function rmk(){
	scrub -p dod $1
	shred -zun 5 -v $1
}

#               __                      __   __                    
# .-----.-----.|  |--.    .-----.-----.|  |_|__|.-----.-----.-----.
# |-- __|__ --||     |    |  _  |  _  ||   _|  ||  _  |     |__ --|
# |_____|_____||__|__|    |_____|   __||____|__||_____|__|__|_____|
#                               |__|                               

setopt AUTOCD              
setopt PROMPT_SUBST        
setopt MENU_COMPLETE      
setopt LIST_PACKED		  
setopt AUTO_LIST           
setopt COMPLETE_IN_WORD

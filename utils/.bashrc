#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='\[\e[38;5;220m\]\w\[\e[0m\] \[\e[38;5;187m\]❯\[\e[0m\] '

eval "$(dircolors ~/.dircolors)"
alias ls='ls --color=auto'
alias n='nvim'
alias cls='clear'

# System Alias
alias ff='fastfetch'

# Peaclock
alias clk='peaclock'

# Lazygit
alias lg='lazygit'

# Games
alias snake='nsnake'

# Config & Style Alias
alias cfghypr='nvim ~/.config/hypr/hyprland.conf'
alias cfgbash='nvim ~/.bashrc'
alias cfginput='nvim ~/.inputrc'
alias cfgwaybar='nvim ~/.config/waybar/config.jsonc'
alias stwaybar='nvim ~/.config/waybar/style.css'
alias cfgwaybarcss='nvim ~/.config/waybar/style.css'
alias cfgkitty='nvim ~/.config/kitty/kitty.conf'
alias cfgnvim='nvim ~/.config/nvim'
alias cfgwofi='nvim ~/.config/wofi/config'
alias stwofi='nvim ~/.config/wofi/style.css'

# Wifi Alias
alias wifi='nmcli connection down izora-ap && echo "Hotspot OFF"'
alias hotspot='nmcli connection up izora-ap && echo "Hotspot ON"'

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export FASTFETCH_IMAGE_BACKEND=kitty

# pnpm
export PNPM_HOME="/home/mukeshg7172/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Created by `pipx` on 2026-01-25 13:46:44
export PATH="$PATH:/home/mukeshg7172/.local/bin"

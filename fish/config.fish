if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end

# Key Command: 
alias cls clear
alias g git

# Fuzzy Finder:
alias tmfi='fzf-tmux'
alias fi='fzf'
alias nvfi='nvim $(fzf)'
alias nvti='nvim $(fzf-tmux)'
alias fid='cd (find * -type d | fzf)'
alias nfid='nvim (find * -type d | fzf)'
alias cfid='code . (find * -type d | fzf)'

# Neovim configurations: 

# Define function 'nvim_custom' that launches nvim with no configuration
function nvim_custom
    env NVIM_APPNAME="$XDG_CONFIG_HOME/nvim_custom/" nvim
end

# alias nvim-custom="NVIM_APPNAME=nvim_custom"

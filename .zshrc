# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Options
setopt GLOB_DOTS

# Plugin manager
source <(antibody init)

# Theme
antibody bundle romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Autocompletion
autoload -Uz compinit
compinit

# Auto-suggestions
antibody bundle zsh-users/zsh-autosuggestions

# Syntax highlighting
antibody bundle zsh-users/zsh-syntax-highlighting

# Vi mode
ZVM_KEYTIMEOUT=1
ZVM_VI_EDITOR='/usr/bin/nvim'
antibody bundle jeffreytse/zsh-vi-mode

# Enable descriptive window titles instead of "Alacritty"
if [[ "${TERM}" != "" && "${TERM}" == "alacritty" ]]
then
    precmd()
    {
        print -Pn "\e]0;$(id --user --name)@$(hostname):%~\a"
    }

    preexec()
    {
        echo -en "\e]0;$(id --user --name)@$(hostname): ${1}\a"
    }
fi

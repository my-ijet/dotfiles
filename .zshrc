# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"

source /usr/share/cachyos-zsh-config/cachyos-config.zsh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export TIME_STYLE=long-iso

alias s="sudo -E "
alias pc="sudo pacman"
alias ls="eza -1 --group-directories-first --icons --time-style=long-iso "
alias lsl="ls -l --no-permissions --no-user --no-time "
alias tree="ls --tree "
# alias ls="ls -oh --color "

alias dm="yadm"
alias ed="nvim"
alias sued="sudoedit"
# alias ed="emacsclient -t "
# alias ed="emacs -nw "
alias emacs-doom="~/.config/emacs/bin/doom"

# alias tcc="LANG=Compiler tcc -Wall "
alias clang="LANG=Compiler clang $CFLAGS $LDFLAGS "
alias clang-asan="LANG=Compiler clang -g -Og -O0 -fsanitize=address -fno-omit-frame-pointer "
alias gcc="LANG=Compiler gcc $CFLAGS $LDFLAGS "
alias gcc-asan="LANG=Compiler gcc -g -Og -O0 -fsanitize=address -fno-omit-frame-pointer "

export GDBHISTFILE=~/.gdb_history

export PATH=~/.nimble/bin:$PATH

export PATH=~/.local/bin:$PATH
export C_INCLUDE_PATH=~/.local/include:$C_INCLUDE_PATH
export LIBRARY_PATH=~/.local/lib:$LIBRARY_PATH
export LD_LIBRARY_PATH=~/.local/lib:$LD_LIBRARY_PATH

export C_INCLUDE_PATH=$C_INCLUDE_PATH:/opt/raylib/include
export LIBRARY_PATH=$LIBRARY_PATH:/opt/raylib/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/raylib/lib

# alias tclsh="rlwrap -r -c tclsh"

export PATH=$PATH:.
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:.

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
autoload -U compinit; compinit
source /usr/share/zsh/plugins/fzf-tab-git/fzf-tab.plugin.zsh

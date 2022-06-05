fish_add_path $HOME/.scripts/

set -x DOTFILES "$HOME/dotfiles"
set -x EDITOR "nvim"
set -x TTYMENU "fuzz -x"

alias ~edit 'edit $DOTFILES/source'
alias ~fast 'make -C $DOTFILES fast'

if status is-interactive
	fish_vi_key_bindings
end

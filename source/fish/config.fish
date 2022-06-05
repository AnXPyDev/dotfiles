fish_add_path $HOME/.scripts/

alias hc herbstclient

alias dots 'git --git-dir=$HOME/.dots --work-tree=$HOME'
alias dotsup 'dots update-index --again'

if status is-interactive
	fish_vi_key_bindings
    # Commands to run in interactive sessions can go here
end

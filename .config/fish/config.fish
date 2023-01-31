abbr -a c cargo
abbr -a e nvim
abbr -a g git
abbr -a ec 'nvim -c "Telescope file_browser"'

# Set vi mode with jj to escape and jk to type j in insert mode 
set fish_key_bindings fish_user_key_bindings

# change cursor type based on vi mode
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

if status --is-interactive
  if ! set -q TMUX
    exec tmux
	end
end

# show directory listing on directory change
function __ls_after_cd__on_variable_pwd --on-variable PWD
  if status --is-interactive
    ls -GF
  end
end

# map ls commands to exa
if command -v exa > /dev/null
  abbr -a l 'exa'
	abbr -a ls 'exa'
	abbr -a ll 'exa -l'
	abbr -a lll 'exa -la'
else
  abbr -a l 'ls'
	abbr -a ll 'ls -l'
	abbr -a lll 'ls -la'
end

function limit
	numactl -C 0,1,2 $argv
end

function d
	while test $PWD != "/"
		if test -d .git
			break
		end
		cd ..
	end
end

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

# Colored man output
setenv LESS_TERMCAP_mb \e'[01;31m'          # Begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'     # Begin bold
setenv LESS_TERMCAP_me \e'[0m'              # end mode 
setenv LESS_TERMCAP_se \e'[0m'              # end standout-mode 
setenv LESS_TERMCAP_so \e'[38;5;246m'       # Begin standout-mode - info box 
setenv LESS_TERMCAP_ue \e'[0m'              # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m'    # begin underline 

# Fish should not add things to clipboard when killing
set FISH_CLIPBOARD_CMD "cat"

function fish_mode_prompt
  switch $fish_bind_mode
    case default
      set_color --bold brgreen 
      echo 'N'
    case insert
      set_color --bold brblue 
      echo 'I'
    case replace_one
      set_color --bold green
      echo 'R'
    case visual
      set_color --bold orange 
      echo 'V'
    case '*'
      set_color --bold red
      echo '?'
  end
  set_color normal
end

function fish_prompt
	set_color brblack
	echo -n "["(date "+%H:%M")"] "
	set_color "#d3869b" 
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green 
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '|'
	set_color normal
end



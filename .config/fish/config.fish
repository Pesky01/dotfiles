abbr -a e nvim
abbr -a g git
abbr -a t task

# alias fzf "cd ~ && cd (fd --type d | fzf)"

# run tmux on shell start
if status is-interactive
    if ! set -q TMUX
        exec tmux -2
        end
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

set -g fish_prompt_pwd_dir_length 3

set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'

############# VIM ##############
set fish_key_bindings fish_user_key_bindings

function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert -m default jj backward-char force-repaint
    bind -M insert jk 'commandline -i j'
end

# show vim mode in prompt
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

# change cursor based on vi mode
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block
################################

############# lsd #############
# map ls commands to lsd
if command -v lsd > /dev/null
    abbr -a ls 'lsd'
    abbr -a ll 'lsd -la'
    abbr -a la 'lsd -a'
    abbr -a l 'lsd -l'
else
    abbr -a ll 'ls -la'
    abbr -a la 'ls -a'
    abbr -a l 'ls -l'
end
###############################

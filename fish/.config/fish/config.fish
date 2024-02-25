if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_prompt
    set -l last_status $status
    # Prompt status only if it's not 0
    set -l stat
    if test $last_status -ne 0
        set stat (set_color red)"[$last_status]"(set_color normal)
    end

    printf '%s%s%s@%s%s: %s%s%s%s %s \n> ' (set_color magenta) $USER (set_color normal) (set_color green) $hostname \
        (set_color blue) $PWD (set_color normal) (fish_git_prompt) $stat
end

function fish_right_prompt -d "Write out the right prompt"
    date '+%m/%d/%y'
end

function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert

    # Then execute the vi-bindings so they take precedence when there's a conflict.
    # Without --no-erase fish_vi_key_bindings will default to
    # resetting all bindings.
    # The argument specifies the initial mode (insert, "default" or visual).
    fish_vi_key_bindings --no-erase insert
end

# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set fish_cursor_default block
# Set the insert mode cursor to a line
set fish_cursor_insert line blink
# Set the replace mode cursors to an underscore
set fish_cursor_replace_one underscore
set fish_cursor_replace underscore
# Set the external cursor to a line. The external cursor appears when a command is started.
# The cursor shape takes the value of fish_cursor_default when fish_cursor_external is not specified.
set fish_cursor_external line
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set fish_cursor_visual block

# Just clear the commandline on control-c
bind \cc 'commandline -r ""'

bind \cP 'history-token-search-backward'
bind \cN 'history-token-search-forward'

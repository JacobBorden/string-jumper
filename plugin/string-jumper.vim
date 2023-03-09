" String Jumper plugin for Neovim
"
" This plugin allows you to search for a string in all files within the current
" directory and its subdirectories, and jump to the selected match.
"
" To use the plugin, simply run the `StringJump` command in Neovim.
"
" Installation:
"   - Use a plugin manager such as vim-plug to install the plugin.
"     For example, add the following line to your init.vim file:
"       Plug 'JacobBorden/string-jumper'
"   - Alternatively, you can manually install the plugin by copying the
"     string-jumper.vim file to your Neovim configuration directory.
"



command! StringJump call StringJump()


function! Callback(selected)
let s:file_path = split(string(a:selected), ':')
let preview_command ='-- preview "bat --color=always ' . s:file_path[0] . ' --highlight-line ' . s:file_path[1].'"'
return preview_command
endfunction

function! StringJump()
	let result = system('grep -R --line-number ".*"')
call fzf#run({'source': 'echo '. string(result), 'options': Callback(result),  'sink': function('SinkFunction'), 'preview-window': 'wrap'})

endfunction

function! SinkFunction(result)
	let s:filePath = split(a:result, ':')
	exec 'edit +' . s:filePath[1] . ' ' . s:filePath[0]
endfunction


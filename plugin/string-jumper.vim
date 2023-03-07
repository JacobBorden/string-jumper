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

let s:previewPath = ""

function! StringJump()
	call fzf#run({'source': 'grep -R --line-number ".*"', 'options':'--preview "bat '. s:previewPath . ' "', 'sink':function('SinkFunction')})
endfunction

function! SinkFunction(result)
	let s:filePath = split(a:result, ':')
	let s:previewPath = s:filePath[1]
	exec 'edit +' . s:filePath[1] . ' ' . s:filePath[0]
endfunction


nnoremap <Leader>g : call fzf#run({ 'source': 'grep -R --line-number  ".*"', 'sink':function( '<sid>sinkFunction'),})<CR><CR>

function! s:sinkFunction(result)
	let filePAth = split(a:result, ':')
	exec 'edit +' . l:filePAth[1] . ' ' . l:filePAth[0]
endfunction


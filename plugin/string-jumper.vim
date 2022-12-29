nnoremap <Leader>s : call fzf#run({ 'source': 'grep -R --line_number  ".*"', 'sink':function( '<sid>sinkFunction'),})<CR>

function! s:sinkFunction(result)
	let filePAth = split(a:result, ':')
	exec 'edit +' . l:filePAth[1] . ' ' . l:filePAth[0]
endfunction


function! StringJump(string)

	" Use grep to search for the thstring in the current directory and sub directories

	runtime! shell.vim
	let escaped_string = shellescape(a:string)
	let results = system('grep -R --color=always --line-number ' . escaped_string . ' . ')
	" Split the results into a list of lines

	let lines = split(results, '\n')
	let matches = filter(lines, 'v:val =~"^\.\/\([^:]*\):\([^:]*\):"')
	let items = []
	for match in lines
		let file = match[1]
		let line = match[2]
		call add(items, {'text': file.':'.line, 'value': file.':'.line.':0'})
	endfor

	" Use fzf to select a match from the list

	" Jump to the selected match
	if !empty(selected)
		execute 'edit +' . selected[0] . ' ' . selected[1]
	endif
endfunction


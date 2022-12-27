function! StringJump(string)

	" Use grep to search for the thstring in the current directory and sub directories

	let results = system('grep -R --color=always --line-number '.shellscape(a:string).' .')


	" Split the results into a list of lines

	let lines = split(results, '\n')


	"Filter out any lines that do not contain a file name and line number

	let matches = filter(lines, 'v:val =~# "^\(\.\/[^:]*\):\([^:]*\):"')

	"Extract the file name and line number from the matches
	let items = []
	for match in matches
		let file = match[1]
		let line = match[2]
		call add(items, {'text': file.':'.line, 'value': file.':'.line.':0'})
	endfor

	"Use fzf to select a match from the list
	let selected = fzf#run(items, {'sink': "call setpos("'.fnameescape('.').'",[line("."), 0, 0, 0])'})
	"Jump to the selected match
	if !empty(selected)
		execute 'edit +'.selected[0].' '.selected[1]
	endif
endfunction

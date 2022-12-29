function! StringJump()
  " Use grep to search for the search string in the current directory and sub directories
  runtime! shell.vim
  let search_string = input("Enter search string: ")
  call feedkeys(search_string . "\<CR>", 'n')
  let escaped_string = shellescape(search_string)
  let results = system('grep -R --color=always --line-number ' . escaped_string . ' . ')

  " Split the results into a list of lines
  let lines = split(results, '\n')

  " Iterate over the list of lines and extract the file name and line number from each line
  let items = []
  for line in lines
	let matches = matchlist(line, '^\.\/\([^:]*\):\([^:]*\):')
	let file = matches[1]
	let line_number = matches[2]
	if !empty(file) && !empty(line_number)
		call add(items, {'text': file.':'.line_number, 'value': file.':'.line_number.':0'})
    endif
    endfor
	
  " Use fzf to select a match from the list
  let selected = fzf#run(items)

  " Jump to the selected match
  if !empty(selected)
    execute 'edit +' . selected[0] . ' ' . selected[1]
  endif
endfunction

function! StringJump(search_string)
  " Use grep to search for the search string in the current directory and sub directories
  runtime! shell.vim
  let escaped_string = shellescape(a:search_string)
  let results = system('grep -R --color=always --line-number ' . escaped_string . ' . ')

  " Split the results into a list of lines
  let lines = split(results, '\n')

  " Iterate over the list of lines and extract the file name and line number from each line
  let items = []
  for line in lines
    let file = matchstr(line, '^\.\/\([^:]*\):')
    let line_number = matchstr(line, ':\([^:]*\):')
    call add(items, {'text': file.':'.line_number, 'value': file.':'.line_number.':0'})
  endfor
	
  " Use fzf to select a match from the list
  let selected = fzf#run(items, {'sink': "call setpos('" . shellescape('.') . "',[line('.'),     0, 0, 0])"})

  " Jump to the selected match
  if !empty(selected)
    execute 'edit +' . selected[0] . ' ' . selected[1]
  endif
endfunction

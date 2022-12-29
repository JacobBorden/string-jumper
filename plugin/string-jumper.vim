function! StringJump()
  " Open a terminal in Neovim
  call termopen()

  " Ask the user to enter a search string
  let search_string = input("Enter search string: ")

  " Run the grep command with the search string as an argument
  let results = system('grep -R --color=always --line-number ' . shellescape(search_string) . ' .')

  " Split the results into a list of lines
  let lines = split(results, '\n')

  " Display the list of lines in a fuzzy search window
  let selected = fzf#run(lines)

  " Extract the file name and line number from the selected line
  let matches = matchlist(selected, '^\.\/\([^:]*\):\([^:]*\):')
  let file = matches[1]
  let line_number = matches[2]

  " Jump to the selected line in the file
  execute 'edit +' . line_number . ' ' . file
endfunction

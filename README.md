# String Jumper

A plugin for quickly jumping to a specific line in a file using grep and fzf.

## Installation

### Using a plugin manager (recommended)

With [vim-plug](https://github.com/junegunn/vim-plug):

1. Add `Plug 'JacobBorden/string-jumper'` to your `~/.vimrc`
2. Run `:PlugInstall`

With [Vundle](https://github.com/VundleVim/Vundle.vim):

1. Add `Plugin 'JacobBorden/string-jumper'` to your `~/.vimrc`
2. Run `:PluginInstall`

### Manual installation

1. Download the latest release from [https://github.com/JacobBorden/string-jumper/releases](https://github.com/JacobBorden/string-jumper/releases)
2. Extract the files and copy them to your `~/.vim` directory

## Usage

To use the plugin, simply type `:StringJump` and enter the search string you want to find. The plugin will use grep to search for the string in all files in the current directory and its subdirectories, and present the results using fzf. Select the desired result and the plugin will open the file and jump to the line containing the search string.

## License

This plugin is released under the MIT License. See [LICENSE](LICENSE) for details.S

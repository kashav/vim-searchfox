## vim-searchfox

vim-searchfox allows you to use [Searchfox](https://searchfox.org) directly from Vim.

### Installation

Install with your preferred installation method. I recommend [vim-plug](https://github.com/junegunn/vim-plug):

```vim
call plug#begin('~/.vim/plugged')
Plug 'kshvmdn/vim-searchfox'
call plug#end()
```

### Usage

To open the current file (at the current line), use the `SFOpen` command.

```
:SFOpen
```

To lookup a word, use the `SFSearch` command. This also works in visual mode with a selection.

```
:SFSearch
```

### Configuration

- `g:vim_sf_url`

  Sets the Searchfox repository URL. Defaults to [mozilla-central](https://hg.mozilla.org/mozilla-central).

  ```vim
  let g:vim_sf_url = "https://searchfox.org/mozilla-central/"
  ```

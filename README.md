
## Guyzmo's Vim configuration

This configuration is based upon a vimrc that has started last century. Most of the
main editing setup is from that time, but everything else has evolved with newer, nicer
techs, like NeoBundle and a few other plugins.

I'm making a great use of the NeoBundleLazy feature so that my vim instance does not
get overloaded.

Because I'm synchronizing my vimrc accross several computers, my vim configuration lies
within `~/.vim/` whereas the bundles and the swapfiles, undofiles are within `~/.local/vim`.

I've oriented my keymap to be working nicely with a dvorak layout, which is why I keep
on using <kbd>,</kbd> as `<leader>` key.

   * NeoBundle configuration
   * Bundles: `Shougo/vimproc.vim`, `Shougo/Unite.vim`, `vim-scripts/GrepCommands`, `bling/vim-airline`,
    `moll/vim-bbye`, `godlygeek/tabular`, `tpope/vim-commentary`, `tpope/vim-git`,
    `tpope/vim-fugitive`, `sjl/gundo.vim`, `tomtom/quickfixsigns_vim`, `tmhedberg/matchit`,
    `tpope/vim-surround`, `tpope/vim-repeat`, `msanders/snipmate.vim`, `reinh/vim-makegreen`,
    `vim-scripts/TaskList.vim`, `scrooloose/syntastic`, `jpalardy/vim-slime`, `oblitum/rainbow`,
    `bkad/CamelCaseMotion`, `mattn/calendar-vim`, `vimwiki/vimwiki`, `Shougo/unite-outline`,
    `kchmck/vim-coffee-script`, `derekwyatt/vim-scala`, `Valloric/YouCompleteMe`, `mkomitee/vim-gf-python`,
    `klen/python-mode`, `kingbin/vim-arduino`, `ervandew/eclim`
   * bundles, swapfiles and undofiles in separate directory from configuration (in `~/.vim/local`)
   * dvorak oriented <leader> based shortcuts:
    * `,n`/`,<space>` or `,p`: next/previous buffer
    * `,bd`: close buffer and window ; `,bc`: close buffer but not window
    * `,bl`: shows unite's buffer list
    * `,bg`: executes a grep within all buffers (result in quickfix)
    * `,s<space>`: strip trailing whitespaces
    * `zt` and `zb` leave a few lines before/after
    * `\t4`: sets current buffer's tab preference, `t` means `expandtabs`, `T` means `noexpandtab`, and `4` is the tab width (can be 1, 2, 4 or 8)
   * colorscheme based on murphy, with a few minor improvements
   * all non text character is matched and showed as dark blue (works well with dark background)
   * all trailing whitespace has a red foreground

HTH

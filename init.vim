set hidden
set nocp
filetype plugin on 

" Override grep to use ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow

" Sets up vscode plugin
if exists('g:vscode')
    " VSCode extension
else
    " ordinary Neovim
endif

" Sets up the plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Installs plugins
call plug#begin()
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

" Custom keymaps
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h; :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

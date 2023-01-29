set nocompatible              " be iMproved, required
filetype off                  " required

" All of your Plugins must be added before the following line
"call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
	syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
	filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)
set number

set incsearch
set hlsearch
set ignorecase
set smartcase
set ruler

set undofile
set autoread

set visualbell

set wrap
set tw=0

" Fix the tabs
set tabstop=4
set sts=4
set sw=4

set listchars=tab:>>,space:~,eol:$

set clipboard=unnamedplus
set foldmethod=indent
set foldlevel=99

set splitbelow

set cursorline
" Set autocommands
autocmd InsertEnter * :set nocursorline
autocmd InsertLeave * :set cursorline
" autocmd InsertEnter * highlight CursorLine ctermfg=46 ctermfg=255

"################################### Key-mappings ############################
nnoremap <space> za

" Key-mapping to close a file without saving (FROM NORMAL MODE ONLY; prevents accidents
nmap <F2> <Esc>:q!<Enter>

" Bash execution in neovim
nmap <F3> <Esc>:w<Enter>:! bash %<Return>
imap <F3> <Esc>:w<Enter>:! bash %<Return>

" Set up IDE-like execution in neovim
nmap <F4> <Esc>:w<Enter>:! g++ %;echo ;./a.out<Return>
imap <F4> <Esc>:w<Enter>:! g++ %;echo ;./a.out<Return>

" Python keybindings
nmap <F5> <Esc>:w<Enter>:! python3 %<Return>
imap <F5> <Esc>:w<Enter>:! python3 %<Return>
noremap <Leader>p <Esc>:w <bar> <Esc>:new <bar> :term ipython3 # -i <CR>A


" Julia keybindings
nmap <F6> <Esc>:w<Enter>:! /usr/bin/julia %<Return>
imap <F6> <Esc>:w<Enter>:! /usr/bin/julia %<Return>
noremap <Leader>j <Esc>:w <bar> <Esc>:new <bar> :term /usr/bin/julia -i # <CR>A

" Nextflow keybinding
nmap <Leader>n <Esc>:w<Enter>:! nextflow run %<Return>

" R execution in neovim
nmap <F7> <Esc>:w<Enter>:! Rscript %<Return>
imap <F7> <Esc>:w<Enter>:! Rscript %<Return>

" Set up file-saving shortcuts
imap <F8> <Esc>:w<Enter>:echo "File saved" <bar> sleep 1 <Enter>
nmap <F8> <Esc>:w<Enter>:echo "File saved" <bar> sleep 1 <Enter>

imap <F9> <Esc>:w<Enter>i<Right>
map <F9> <Esc>:w<Enter>i<Right>

imap <F10> <Esc>:wq<Enter>
nmap <F10> <Esc>:wq<Enter>

" Create keybinding to quickly comment/uncomment line (Place # in front)
imap <M-c> <Esc>I#<Esc>A
nmap <M-c> <Esc>I#<Esc>

" Create a keybinding
imap <M-x> <Esc>:.s/\[.\]/\[x\]/e <bar> .s/\[\]/\[x\]/e<Return><Esc>:noh<Return>
nmap <M-x> <Esc>:.s/\[.\]/\[x\]/e <bar> .s/\[\]/\[x\]/e<Return><Esc>:noh<Return>

imap <M-u> <Esc>^x<Esc>A
nmap <M-u> <Esc>^x<Esc>A

" Create keybinding to replace M-u (insert mode undo command)
imap <C-z> <Esc>u<Esc>i

" Set up keybindings for quickly inserting a line above (C-a) or a below (C-b) current line
imap <C-b> <Esc>o<Enter><Esc><Up>dda
imap <C-a> <Esc>O<Enter><Esc>dda

" Set up keybindings to quickly delete while in insert mode
imap <C-d> <Esc>ddA
imap <C-e> <Right><Esc>d$i<Right>

" Set up keybindings for Visual mode
imap <C-p> <Esc>pA

" Set up keybindings for general shortcuts
imap <C-l> <Esc>:set list<Enter>i
imap <C-n> <Esc>:set nolist<Enter>i

imap <C-y> <Esc>:set syntax=python<Enter>i
imap <C-k> <Esc>:set syntax=markdown<Enter>i

" Keybinding to close preview windows
imap <C-q> <Esc>:pc<Enter>A

" Keybinding to put in a long comment line
imap <C-C> ####################


" ======== Leader-based keybinding ===========
" Toggle variable explorer
noremap <Leader>v :TagbarToggle<CR>

" Toggle file explorer
noremap <Leader>f :NERDTreeToggle<CR>

" Open a terminal below
noremap <Leader>ht :new <bar> :term<CR><Esc>:set nonumber<CR>A
noremap <Leader>vt :vnew <bar> :term<CR><Esc>:set nonumber<CR>A

"Navigating split panes
nnoremap <Leader><Up> <C-W><C-k>
nnoremap <Leader><Down> <C-W><C-j>
nnoremap <Leader><Left> <C-W><C-h>
nnoremap <Leader><Right> <C-W><C-l>

" Navigating tabs
nnoremap <Leader>, :tabprevious<CR>
nnoremap <Leader>. :tabnext<CR>


if has('win32') || has('win64')
	let g:plugged_home = '~/AppData/Local/nvim/plugged'
else
	let g:plugged_home = '~/.vim/plugged'
endif

let g:python3_host_prog = '/usr/bin/python3'

call plug#begin(g:plugged_home)

"UI related
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Better Visual Guide
Plug 'Yggdroot/indentLine'

"Code completion
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }

"syntax check
"Plug 'w0rp/ale'

"nextflow highlighting
Plug 'LukeGoodsell/nextflow-vim'

" Variable viewer
Plug 'majutsushi/tagbar'

" File tree explorer
Plug 'preservim/nerdtree'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'} " COC auto-completion for nvim

" Quick and powerful comment line syntax
Plug 'preservim/nerdcommenter'
filetype plugin on

" Comment out lines using:
"	[count]<leader>cc |NERDCommenterComment|
"		- Comment out the current line or text selected in visual mode.
"	[count]<leader>cn |NERDCommenterNested|
"		- Same as cc but forces nesting.
"	[count]<leader>c<space> |NERDCommenterToggle|
"		- Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.


" Add in Git support
Plug 'tpope/vim-fugitive'

" Multi-line cursor support
Plug 'terryma/vim-multiple-cursors'

" Julia editor support
Plug 'JuliaEditorSupport/julia-vim'
"Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh'}
"nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use tab for trigger completion with characters ahead and navigate
"inoremap <silent><expr> <TAB>
"			\ pumvisible() ? \<C-n> :
"			\ <SID>check_back_space() ? \<TAB> :
"			\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? \<C-p> : \<C-h>

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction


" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Add (Neo)Vim's native statusline support.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"let g:airline_theme = 'dark'
"let g:coc_node_path = '/home/sayf/.nvm/versions/node/v12.12.0/bin/node'

" Formater
Plug 'Chiel92/vim-autoformat'
call plug#end()
filetype plugin indent on

" Color customization
set background=dark

highlight Normal ctermbg=235
highlight Normal ctermfg=15
highlight Comment ctermfg=3
highlight Statement ctermfg=208
highlight Function ctermfg=213
highlight String ctermfg=46
highlight Character ctermfg=196

highlight MatchParen ctermfg=black ctermbg=123
highlight SpecialKey ctermfg=255

" Customize pop-up menu colors
highlight PmenuSel ctermbg=255 ctermfg=black
highlight Pmenu ctermbg=232 ctermfg=255
highlight PmenuSbar ctermbg=255 ctermfg=black
highlight PmenuThumb ctermbg=black ctermfg=1

" Jump to last edited place when opening file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"====================== Custom commands =========================
"Command to insert the current date and time
command Date :r ! echo "Date: $(date | awk '{OFS=", "}{print $3, $2, $4}')"
command Stamp :r ! echo "TimeStamp: $(date)"

"Command to AddParser without having to type the whole ':call function' headache
command ImportParser :call ImportParser()
command ImportPyMods :call ImportPyMods()


"============== Custom functions ======================
"Function to place correct python interpreter
function WhichPy()
	:r ! echo "\#\!$(which python3)"
	:0
	:del
endfunction

nnoremap <C-w> :call WhichPy()<Return><Esc>o

" Function to insert ArgumentParser into file
function ImportParser()
	:r ! echo "import argparse as ap"
	:r ! echo 'parser = ap.ArgumentParser(description="""'
	:r ! echo ''
	:r ! echo '""", formatter_class=ap.RawTextHelpFormatter)'
	:r ! echo ''
	:r ! echo 'parser.add_argument("")'
	:startinsert!
endfunction

" Function to add commonly used python modules
function ImportPyMods()
	:r ! echo "import numpy as np"
	:r ! echo "import pandas as pd"
	:r ! echo "import matplotlib.pyplot as plt"
	:r ! echo "import seaborn as sns"
	:r ! echo "import os"
	:r ! echo "import subprocess as sp"
	:startinsert!
endfunction


" Auto-Command to correct 'mixed-indenting'
"if has("autocmd")
"	au BufWritePre,BufRead * :normal gg=G
"endif

" Command to fix mixed-indent files
command FixIndents :normal gg=G

" Command to insert a page-break in a markdown document
command PageBreak :r ! echo '<div style="page-break-after: always"></div>'

" Keybinding to fix mix-indent files
" nmap <C-i> gg=G

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
	source /etc/vim/vimrc.local
endif

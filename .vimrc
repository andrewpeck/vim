set nocompatible

filetype off " needed for vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/nerdtree.git'
nmap <silent> <Leader>n :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 40
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagList 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'vim-scripts/taglist.vim'
nmap <silent> <Leader>t :TlistToggle<CR>
let g:Tlist_WinWidth = 60
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabularize
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'godlygeek/tabular.git'
map <silent> <Leader>T :Tabularize/\|<CR>
map <silent> <Leader>= :Tabularize/^[^=]*\zs=/l1<CR>
map <silent> <Leader>( :Tabularize/^[^(]*\zs (/l0<CR>
map <silent> <Leader>/ :Tabularize/\(^\s*\)\@<!\/\//l1<CR>
"map <silent> <Leader>/ :Tabularize/\(^\s*\|\/\/.*\)\@<!\/\//l1<CR>
"map <silent> <Leader>/ :Tabularize/[^\/\/]\/\//l1<CR> 
map <silent> <Leader>[ :Tabularize/ [/l0<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TPope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'lervag/vimtex'
Plugin 'mbbill/undotree'
Plugin 'ervandew/supertab'
Plugin 'morhetz/gruvbox'
Plugin 'tpope/vim-surround'
Plugin 'tmhedberg/matchit'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-scripts/a.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" END VUNDLE 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()            " required
filetype plugin indent on    " required

filetype plugin indent on
filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" better $ matching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    runtime macros/matchit.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scrolling offset
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set scrolloff=5

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" netrw file explorer
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "leader e to open netrw
    nmap <silent> <Leader>e :Explore<CR>

    "hide the giant banner at the top of netrw
    let g:netrw_banner=0
    " hide gitignored files from netrw
    " if !has("win32")
    " let g:netrw_list_hide=netrw_gitignore#Hide()
    " endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" always show status line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set laststatus=2


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " " Enable the list of buffers
    " let g:airline#extensions#tabline#enabled = 1

    " " Show just the filename
    " let g:airline#extensions#tabline#fnamemod = ':t'
    " let g:airline_theme             = 'powerlineish'
    " let g:airline_powerline_fonts = 1
    " if !exists('g:airline_symbols')
    "     let g:airline_symbols = {}
    " endif

    " set encoding=utf-8
    " " unicode symbols
    " let g:airline_left_sep = '»'
    " let g:airline_left_sep = '▶'
    " let g:airline_right_sep = '«'
    " let g:airline_right_sep = '◀'
    " let g:airline_symbols.linenr = '␊'
    " let g:airline_symbols.linenr = '␤'
    " let g:airline_symbols.linenr = '¶'
    " let g:airline_symbols.branch = '⎇'
    " let g:airline_symbols.paste = 'ρ'
    " let g:airline_symbols.paste = 'Þ'
    " let g:airline_symbols.paste = '∥'
    " let g:airline_symbols.whitespace = 'Ξ'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlighting for Arduino .ino files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    autocmd!
    autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
    autocmd BufNewFile,BufReadPost *.inc       set filetype=cpp
    augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "Delete trailing whitespace with <Leader>rtw
    nnoremap <Leader>rtw :%s/\s\+$//e<CR>

    "Remove trailing whitespace automatically on Save
    "augroup RemoveTrailingWhitespace
    "    autocmd BufWritePre *.cpp :%s/\s\+$//e
    "    autocmd BufWritePre *.hpp :%s/\s\+$//e
    "    autocmd BufWritePre *.c   :%s/\s\+$//e
    "    autocmd BufWritePre *.h   :%s/\s\+$//e
    "    "autocmd BufWritePre *.v   :%s/\s\+$//e
    "augroup END

    highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

    " Show trailing whitespace:
    match ExtraWhitespace /\s\+$/

    " Show trailing whitespace and spaces before a tab:
    match ExtraWhitespace /\s\+$\| \+\ze\t/

    " Show tabs that are not at the start of a line:
    match ExtraWhitespace /[^\t]\zs\t\+/


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dont indent Access Specifiers in C++ 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "set cinoptions+=g0



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimdiff highlighting 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Fix the difficult-to-read default setting for diff text highlighting.  The
    " " bang (!) is required since we are overwriting the DiffText setting. The
    " highlighting
    " for "Todo" also looks nice (yellow) if you don't like the "MatchParen" colors.
    " highlight! link DiffText MatchParen

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Better Match Paren
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    :hi MatchParen cterm=bold ctermbg=none ctermfg=none

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set leader key
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    ":let mapleader = ","
    "

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"better tab navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    nnoremap <C-Tab>    :tabnext<CR>
    nnoremap <C-S-Tab>  :tabprevious<CR>
    ""nnoremap <C-A-t>    :tabnew<CR>
    inoremap <A-Left>   <Esc>:tabprevious<CR>i
    inoremap <A-Right>  <Esc>:tabnext<CR>i
    inoremap <C-A-t>    <Esc>:tabnew<CR>
    nnoremap <D-Left>   :tabprevious<CR>
    nnoremap <D-Right>  :tabnext<CR>
    nnoremap <C-A-t>    :tabnew<CR>
    "nnoremap <C-S-t>    :tabnew<CR>
    inoremap <A-Left>   <Esc>:tabprevious<CR>i
    inoremap <A-Right>  <Esc>:tabnext<CR>i
    inoremap <C-A-t>    <Esc>:tabnew<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change maximum number of tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set tabpagemax=100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"easier manual indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    vnoremap > >gv
    vnoremap < <gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" better line moving
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    nnoremap <A-Down>      :m .+1<CR>
    nnoremap <A-Up>        :m .-2<CR>
    inoremap <A-Down> <Esc>:m .+1<CR>gi
    inoremap <A-Up>   <Esc>:m .-2<CR>gi
    vnoremap <A-Down>      :m '>+1<CR>gv
    vnoremap <A-Up>        :m '<-2<CR>gv

    "nnoremap <A-Down>      :m .+1<CR>==
    "nnoremap <A-Up>        :m .-2<CR>==
    "inoremap <A-Down> <Esc>:m .+1<CR>==gi
    "inoremap <A-Up>   <Esc>:m .-2<CR>==gi
    "vnoremap <A-Down>      :m '>+1<CR>gv=gv
    "vnoremap <A-Up>        :m '<-2<CR>gv=gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    nnoremap <F5> :UndotreeToggle<cr>

    "nmap <silent> <Leader>u :UndotreeToggle<CR>

    set undofile
    set undodir=~/.vim/undodir

    set history=2000
    set undolevels=2000

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text Width
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set colorcolumn=120
    "set tw=120

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" paste mode toggle 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set pastetoggle=<F3>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turn on mouse
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set mouse=a

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    syntax on
    set nocursorcolumn
    set cursorline
    syntax sync minlines=256
    set t_Co=256

    highlight Cursor guifg=white guibg=black
    highlight iCursor guifg=white guibg=steelblue
    set guicursor=n-v-c:block-Cursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10
    set guicursor+=i:ver25-iCursor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" smaller hardcopy printed fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set printfont=Courier:h7
    set printoptions=paper:letter,syntax:y,wrap:y,number:y,portrait:n,left:0.1in,right:0.1in,top:0.1in,bottom:0.1in,header:0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better backspace behavior
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=eol,start,indent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Font
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    if hostname()=='zenbook'
        " make the font a little bit bigger for the laptop
        set guifont=Source\ Code\ Pro\ 11,Inconsolata\ 11
    else
        set guifont=Monospace\ 9,Source\ Code\ Pro\ 9,Inconsolata\ 9,Consolas\ 10
    endif

    "set guifont=Monospace\ 9
    "if hostname()=='arch'
    "    set guifont=Source\ Code\ Pro\ 9
    "else 
    "endif

    "if has("unix")
    "    if hostname()=='zenbook'
    "        set guifont=Source\ Code\ Pro\ 10
    "    if hostname()=='ucla-cms-pc'
    "        set guifont=Source\ Code\ Pro\ 9
    "    elseif hostname()=='arch'
    "        set guifont=Source\ Code\ Pro\ for\ Powerline\ 9
    "    else
    "    endif
    "endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    silent! colorscheme gruvbox
    set background=dark

    " if has("gui_running")
    "     silent! colorscheme gruvbox
    "     set background=dark

    "     "syntax enable
    "     "let g:solarized_italic=0    "default value is 1
    "     "let g:solarized_contrast="low"    "default value is normal
    "     "set background=dark
    "     "colorscheme solarized
    "     "colorscheme summerfruit256
    "     "set background=light
    "     "colorscheme peachpuff 
    "     "colorscheme desert256
    "     "colorscheme github
    " else
    "     set background=dark
    "     colorscheme gruvbox
    "     "set bg=dark
    "     "let g:solarized_contrast="low"    "default value is normal
    "     "colorscheme solarized
    "     "colorscheme summerfruit256
    " endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" folding settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set foldmethod=indent     "fold based on indent
    set foldnestmax=4       "deepest fold is 10 levels
    set nofoldenable       "dont fold by default
    set foldlevel=99        "this is just what i use
    " <2-LeftMouse>     Open fold, or select word or % match.
    nnoremap <expr> <2-LeftMouse> foldclosed(line('.')) == -1 ? "\<2-LeftMouse>" : 'zo'
    " nnoremap <Tab> zo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comment Insertion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " Kubic style comment insertion
    autocmd BufRead,BufNewFile *.c,*.cpp,*.h,*.v nmap <silent> <Leader>C o//<ESC>120A-<ESC>0121\|DyypO// <ESC>
    autocmd BufRead,BufNewFile *.c,*.cpp,*.h,*.v nmap <silent> <Leader>c o//<ESC>120A-<ESC>0121\|D

    " Vimrc comment insertion
    autocmd BufRead,BufNewFile *.vimrc           nmap <silent> <Leader>C o""<ESC>120A"<ESC>0121\|DyypO" <ESC>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  f6 to replace C++ comments with C-style comments
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F6> k/\/\/<CR>xxi/* <Esc>:silent .,.s/\/\*  /\/\* /<Esc>A */<Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable auto comment continuation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LaTeX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "vim latex variables
    " LaTeX (rubber) macro for compiling
    "nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>
    " View PDF macro; '%:r' is current file's root (base) name.
    "nnoremap <leader>v :!atril %:r.pdf &<CR><CR>

    set grepprg=grep\ -nH\ $*

    "let Tex_FoldedSections=""
    "let Tex_FoldedEnvironments=""
    "let Tex_FoldedMisc=""
    "let g:Tex_DefaultTargetFormat = 'pdf'
    "let g:latex_latexmk_options = '-pdf'
    "let g:Tex_CompileRule_pdf = 'latexmk -pdf'
    "let g:Tex_CompileRule_pdf = 'pdflatex -interactionmode=nonstop $*.tex'
    "let g:Tex_ViewRule_pdf = 'zathura'
    "let g:tex_flavor = "latex"
    "let g:Tex_MultipleCompileFormats = "dvi,pdf"

    let g:vimtex_view_method="zathura"
	"let g:vimtex_view_general_viewer = 'okular'
	"let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
	"let g:vimtex_view_general_options_latexmk = '--unique'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    noremap <Leader>wn :call WhiteSpace()<CR>

    "match MaybeExtraWhitespace /\s\+\%#\@<!$/
    "au InsertEnter * match MaybeExtraWhitespace /\s\+\%#\@<!$/
    "au InsertLeave * match MaybeExtraWhitespace /\s\+\%#\@<!$/
    "
    "function! WhiteSpace()
    "	if s:hilightws
    "		highlight link MaybeExtraWhitespace NONE
    "		let s:hilightws = 0
    "		echo "Whitespace Highlighting On"
    "	else
    "		highlight link MaybeExtraWhitespace ExtraWhitespace
    "		let s:hilightws = 1
    "		echo "Whitespace Highlighting Off"
    "	endif
    "endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spelling Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    if has("spell")
        "Turn on Spell check (us english)
        setlocal spell spelllang=en_us
        "highlight clear SpellBad
        "highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline,bold
        "highlight clear SpellCap
        "highlight SpellCap term=underline cterm=underline
        "highlight clear SpellRare
        "highlight SpellRare term=underline cterm=underline
        "highlight clear SpellLocal
        "highlight SpellLocal term=underline cterm=underline
        "nn :setlocal spell! spelllang=en_us
        "imap :setlocal spell! spelllang=en_us
    endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" window title 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " This autocmd changes the window-local current directory to be the same as the
    " directory of the current file. It fails silently to prevent error messages
    " when you edit files via ftp or new files. It works better in some cases
    " because the autocmd is not nested, and will therefore not fire when switching
    " buffers via another autocmd. It will also work in older versions of Vim or
    " versions compiled without the 'autochdir' option. Note, however, that there
    " is no easy way to test for this autocmd in a script like there is for the
    " 'autochdir' option.
    augroup WindowName
        autocmd BufEnter * silent! lcd %:p:h
    augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"tab settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set smarttab
    set expandtab
    set shiftround " >> << keys move to multiple values of shiftwidth

    " use width=2 tabs in verilog for Kubic-Kompatible-Kode
    autocmd FileType verilog setlocal tabstop=2 softtabstop=2 shiftwidth=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set title of window to file name
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set title

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" search options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set showmatch
    set matchtime=3
    set incsearch
    set hlsearch
    set ignorecase
    set smartcase
    "nnoremap <esc> :noh<return><esc>
    "escape clears highlighted search terms

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remember previous buffer session
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    exec 'set viminfo=%,' . &viminfo

    "let python_highlight_all = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In insert mode, C-BS to delete previous word, and C-DEL to delete next
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    imap <C-BS> <C-W>
    imap <C-DEL> <ESC>ldei


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets F2 to enable and disable line numeration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set nu!
    nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" better soft wrapping 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "Allows for <LEADER>+w to enable and disable soft word-wrapping
    "With word wrap turned on, the arrow keys correspond to gj gk
    "allowing us to move through visual lines
    noremap <silent> <Leader>w :call ToggleWrap()<CR>
    function ToggleWrap()
        if &wrap
            "Wrap OFF"
            setlocal nowrap
            set virtualedit=all
            silent! nunmap <buffer> <Up>
            silent! nunmap <buffer> <Down>
            silent! nunmap <buffer> <Home>
            silent! nunmap <buffer> <End>
            silent! iunmap <buffer> <Up>
            silent! iunmap <buffer> <Down>
            silent! iunmap <buffer> <Home>
            silent! iunmap <buffer> <End>

            silent! nunmap <buffer>  k 
            silent! nunmap <buffer>  j
        else
            "Wrap ON"
            setlocal wrap linebreak nolist

            if has("breakindent")
                " stupid windows binary doesn't have breakindent
                setlocal breakindent
            endif

            "set virtualedit=
            "setlocal display+=lastline
            noremap  <buffer> <silent> <Up>   gk
            noremap  <buffer> <silent> <Down> gj
            noremap  <buffer> <silent> <Home> g<Home>
            noremap  <buffer> <silent> <End>  g<End>
            inoremap <buffer> <silent> <Up>   <C-o>gk
            inoremap <buffer> <silent> <Down> <C-o>gj
            inoremap <buffer> <silent> <Home> <C-o>g<Home>
            inoremap <buffer> <silent> <End>  <C-o>g<End>

            noremap  <buffer> <silent> k  gk
            noremap  <buffer> <silent> j  gj
        endif
    endfunction
    "default to nowrap
    setlocal nowrap
    call ToggleWrap()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"parenthesis match options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    ":hi MatchParen cterm=none ctermbg=black ctermfg=white

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"encryption
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set cryptmethod=blowfish

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ignore whitespace in vimdiff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set diffopt+=iwhite

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"better tab completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set wildmode=longest,list,full
    set wildmenu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" have ctags look in higher directories
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    :set tags=./tags,./../tags,./../../tags,./../../../tags,tags

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" turn on ruler
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set ruler

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow saving of files as sudo when I forgot to start vim using sudo.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    cmap w!! w !sudo tee > /dev/null %

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    if has("win32")
        let latex_view_general_viewer = "C:\\Program Files (x86)\\Adobe\\Reader 11.0\\Reader\\AcroRd32.exe"
        let Tlist_Ctags_Cmd = 'C:\ctags.exe'
        set gfn=Consolas
    endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn off annoying middle mouse paste
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    map  <MiddleMouse> <Nop>
    imap <MiddleMouse> <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse block selection
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    noremap  <M-LeftMouse> <4-LeftMouse>
    inoremap <M-LeftMouse> <4-LeftMouse>
    onoremap <M-LeftMouse> <C-C><4-LeftMouse>
    noremap  <M-LeftDrag>  <LeftDrag>
    inoremap <M-LeftDrag>  <LeftDrag>
    onoremap <M-LeftDrag>  <C-C><LeftDrag>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change Backup File behavor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " n.b. For Unix and Win32, if a directory ends in two path separators, the swap
    " file name will be built from the complete path to the file with all path
    " separators substituted to percent '%' signs. This will ensure file name
    " uniqueness in the preserve directory.

    if has("win32")
        set directory=c:\\vimtmp\\
        set backupdir=c:\\vimtmp\\
    else 
        set directory=$HOME/.vim/tmp//
        set backupdir=$HOME/.vim/tmp//
    endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add Underscore as Word Bounder
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set iskeyword-=_

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Produce header guard when creating new header files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change splitting position
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set splitbelow
set splitright


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow virtual highlighting in visual block mode
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set virtualedit=block

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When joining lines, set a mark to return to afterwards
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap J mzJ`z

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Magic increment
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Incr()
  let a = line('.') - line("'<")
  let c = virtcol("'<")
  if a > 0
    execute 'normal! '.c.'|'.a."\<C-a>"
  endif
  normal `<
endfunction
vnoremap <C-a> :call Incr()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wrap at 120 characters, but don't insert stupid linebreaks
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"set tw=120
set linebreak
set nolist
set wrapmargin=0
set formatoptions-=t

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ergonomic remappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nmap <Space>v <C-v> 
nmap <Space>f <C-f> 
nmap <Space>b <C-b> 

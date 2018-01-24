" buffer-variable    b:    Local to the current buffer.
" window-variable    w:    Local to the current window.
" tabpage-variable   t:    Local to the current tab page.
" global-variable    g:    Global.
" local-variable     l:    Local to a function.
" script-variable    s:    Local to a |:source|'ed Vim script.
" function-argument  a:    Function argument (only inside a function).
" vim-variable       v:    Global, predefined by Vim.


set nocompatible

if has("gui_macvim")
    let macvim_skip_cmd_opt_movement = 1
endif


filetype off " needed for vundle

"if (has("win32"))


"    call plug#begin(~/vimfiles/plugged)
"else
    call plug#begin()
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERD
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'scrooloose/nerdtree'
" nmap <silent> <Leader>n :NERDTreeToggle<CR>
" let g:NERDTreeWinSize = 40
Plug 'scrooloose/nerdcommenter'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagList
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/taglist.vim'
nmap <silent> <Leader>t :TlistToggle<CR>
let g:Tlist_WinWidth = 60

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl-P
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pbogut/fzf-mru.vim'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard | grep -v \.svn']
map <silent> <C-p> :GFiles

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FZF
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

map <silent> <Leader>tt :Tags<CR>
map <silent> <Leader>f :Files ~/Dropbox<CR>
map <silent> <Leader>g :GGrep<CR>
map <silent> <Leader>rr :FZFMru<CR>
map <silent> <Leader>rg :Rg<CR>
map <silent> <Leader>b :Buffers<CR>

" 'rg -g "" --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg -g "" --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'},'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'},'right:50%'),
  \   <bang>0)

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'},'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 3..'},'right:50%'),
  \   <bang>0)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git Gutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'airblade/vim-gitgutter'
let g:gitgutter_max_signs = 2000  " default value
set updatetime=250
nmap <Leader>gg :GitGutterToggle<CR>
" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM Fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'tpope/vim-fugitive'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ultisnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
set runtimepath+=~/.vim/UltiSnips/
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

let g:UltiSnipsExpandTrigger = "<c-c>"
let g:UltiSnipsJumpForwardTrigger       =  "<c-j>"
let g:UltiSnipsJumpBackwardTrigger      =  "<c-k>"


"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tabularize
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'godlygeek/tabular'
map <silent> <Leader>= :Tabularize/^[^=]*\zs=/l1<CR>
map <silent> <Leader>( :Tabularize/^[^(]*\zs (/l0<CR>
map <silent> <Leader>/ :Tabularize/\(^\s*\)\@<!\/\//l1<CR>
map <silent> <Leader>T :Tabularize/\ \| <CR>
"map <silent> <Leader>/ :Tabularize/\(^\s*\|\/\/.*\)\@<!\/\//l1<CR>
"map <silent> <Leader>/ :Tabularize/[^\/\/]\/\//l1<CR>
map <silent> <Leader>[ :Tabularize/ [/l0<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if (!(hostname()=='ucla-cms-pc') && !(has("win32")))
Plug 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
"map <silent> <Leader>f :YcmCompleter FixIt<CR>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'scrooloose/syntastic'
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Conflict Motions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/ConflictMotions'
Plug 'vim-scripts/CountJump' " needed by ConflictMotions
Plug 'vim-scripts/ingo-library' " needed by ConflictMotions

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'gabrielelana/vim-markdown'

Plug 'lervag/vimtex'
Plug 'mbbill/undotree'
"Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'tmhedberg/matchit'
Plug 'vim-scripts/a.vim'
Plug 'thirtythreeforty/lessspace.vim'
Plug 'metakirby5/codi.vim'
Plug 'vhda/verilog_systemverilog.vim'

let g:lessspace_enabled = 1

Plug 'w0rp/ale'

" Marked is OSX Only
if system('uname -s') == "Darwin\n"
Plug 'itspriddle/vim-marked'
endif

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'dmcgrady/vim-lucario'
Plug 'dracula/vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/seoul256.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" END VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()
filetype plugin indent on    " required
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
" C++ Syntax Highlighting for Arduino .ino files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    augroup arduino
        autocmd!
        autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
    augroup END

    autocmd BufNewFile,BufReadPost *.inc       set filetype=cpp

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" trailing whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    "Delete trailing whitespace with <Leader>rtw
    nnoremap <Leader>rtw mz:%s/\s\+$//e<CR>`z

    "Remove trailing whitespace automatically on Save
    "augroup RemoveTrailingWhitespace
    "    autocmd!
    "    autocmd BufWritePre *.cpp :%s/\s\+$//e
    "    autocmd BufWritePre *.hpp :%s/\s\+$//e
    "    autocmd BufWritePre *.c   :%s/\s\+$//e
    "    autocmd BufWritePre *.h   :%s/\s\+$//e
    "   "autocmd BufWritePre *.v   :%s/\s\+$//e
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

    " new tab
    nnoremap <C-A-t>         :tabnew<CR>
    inoremap <C-A-t>    <Esc>:tabnew<CR>

    " tab next/prev
    inoremap <C-Tab>>>  <Esc>:tabnext<CR>i
    nnoremap <C-Tab>         :tabnext<CR>
    inoremap <C-S-Tab>  <Esc>:tabprevious<CR>i
    nnoremap <C-S-Tab>       :tabprevious<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change maximum number of tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set tabpagemax=100

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"easier manual indentation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " rehighlight the same block of characters after indenting

    vnoremap > >gv
    vnoremap < <gv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" better line moving
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    nnoremap <A-Down>      :m .+1<CR
    nnoremap <A-Up>        :m .-2<CR>
    inoremap <A-Down> <Esc>:m .+1<CR>gi
    inoremap <A-Up>   <Esc>:m .-2<CR>gi
    vnoremap <A-Down>      :m '>+1<CR>gv
    vnoremap <A-Up>        :m '<-2<CR>gv

    nnoremap <M-Down>      :m .+1<CR>
    nnoremap <M-Up>        :m .-2<CR>
    inoremap <M-Down> <Esc>:m .+1<CR>gi
    inoremap <M-Up>   <Esc>:m .-2<CR>gi
    vnoremap <M-Down>      :m '>+1<CR>gv
    vnoremap <M-Up>        :m '<-2<CR>gv

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
    set undodir=~/Dropbox/.vim/undodir

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
        set guifont=Ubuntu\ Mono\ 13
        ",Ricty\ Diminished\ Regular\ 13,Inconsolata-g\ 11,Source\ Code\ Pro\ 11,Inconsolata\ 11
    elseif hostname()=='ucla-cms-pc'
        set guifont=DejaVu\ Sans\ Mono\ 10
    elseif hostname()=='arch'
        set guifont=Inconsolata-g\ 9,DejaVu\ Sans\ Mono\ 10,Monofur\ Bold\ 10,Monospace\ 9,Source\ Code\ Pro\ 9,Inconsolata\ 9,Consolas\ 9
    elseif system('uname -s') == "Darwin\n"
        "set noantialias
        set guifont=Monaco:h14
    else
        set guifont=Monospace\ 9
    endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    silent! colorscheme peachpuff
    silent! colorscheme desert256
    silent! colorscheme solarized
    silent! colorscheme github
    "silent! colorscheme PaperColor

    "set background=dark
    "silent! colorscheme gruvbox
    "let g:gruvbox_contrast_dark="soft"

    set background=light
    silent! colorscheme summerfruit256

    "set background=dark
    "set background=light

    " if has("gui_running")
    "     "syntax enable
    "     "let g:solarized_italic=0    "default value is 1
    "     "let g:solarized_contrast="low"    "default value is normal
    "     "set background=dark
    "     "set background=light
    " else
    "     set background=dark
    "     "let g:solarized_contrast="low"    "default value is normal
    " endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Formatting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    syntax on
   "set nocursorcolumn
    set cursorcolumn
    set cursorline

    "gruvbox
    if (g:colors_name=="gruvbox")
        hi CursorLine   term=bold ctermfg=NONE guifg=NONE ctermbg=black guibg=black
        hi CursorColumn term=bold ctermfg=NONE guifg=NONE ctermbg=black guibg=black
    elseif (g:colors_name=="summerfruit256")
        "summerfruit
        hi CursorLine   term=bold ctermfg=NONE guifg=NONE ctermbg=NONE  guibg=#F4F4F4
        hi CursorColumn term=bold ctermfg=NONE guifg=NONE ctermbg=NONE  guibg=#F4F4F4
    endif

    syntax sync minlines=256
    "set t_Co=256

    highlight Cursor  guifg=white guibg=black
    highlight iCursor guifg=white guibg=black
    "highlight iCursor guifg=white guibg=steelblue " steelblue was nice on gruvbox
    set guicursor=n-v-c:block-Cursor
    set guicursor+=n-v-c:blinkon0
    set guicursor+=i:blinkwait10
    set guicursor+=i:ver25-iCursor

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" folding settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    set foldmethod=indent " fold based on indent
    set foldnestmax=4     " deepest fold is 10 levels
    set nofoldenable      " dont fold by default
    set foldlevel=99      " this is just what i use

    " <2-LeftMouse>     Open fold, or select word or % match.
    nnoremap <expr> <2-LeftMouse> foldclosed(line('.')) == -1 ? "\<2-LeftMouse>" : 'zo'
    " nnoremap <Tab> zo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comment Insertion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    augroup commentinsertion
        autocmd!

        " Kubic style comment insertion for C family and Verilog
        autocmd BufRead,BufNewFile *.c,*.cpp,*.h,*.v nmap <silent> <buffer> <leader>C o//<ESC>120A-<ESC>0121\|DyypO// <ESC>
        autocmd BufRead,BufNewFile *.c,*.cpp,*.h,*.v nmap <silent> <buffer> <leader>c o//<ESC>120A-<ESC>0121\|D0w

        " Vimrc comment insertion
        autocmd BufRead,BufNewFile *.vimrc           nmap <silent> <buffer> <leader>C o<ESC>0i""<ESC>120A"<ESC>0121\|DyypO" <ESC>

        " VHDL Comment Insertion  Thomas Style
        autocmd BufRead,BufNewFile *.vhdl,*.vhd      nmap <silent> <buffer> <leader>C o--<ESC>25a=<ESC>a--<ESC>yypO--==  ==--<ESC>

        autocmd BufRead,BufNewFile cpp,c,verilog     map <F6> k/\/\/<CR>xxi/* <Esc>:silent .,.s/\/\*  /\/\* /<Esc>A */<Esc>
    augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" disable auto comment continuation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup commentcontinuation
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

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

    if (system('uname -s') == "Darwin\n")
        " Change default target to pdf, if not dvi is used
        let g:Tex_DefaultTargetFormat = 'pdf'

        " Setup the compile rule for pdf to use pdflatex with synctex enabled
        let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'

        " PDF display rule
        let g:Tex_ViewRule_pdf = 'open -a Skim'

        map ,ll <leader>ll

        " ,ls to forward search
        map <leader>ls :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>

        " ,lv to display pdf
        map ,lv <leader>lv

"        let g:vimtex_view_general_viewer
"                    \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
"         let g:vimtex_view_general_options = '-r @line @pdf @tex'
"         let g:Tex_DefaultTargetFormat = 'pdf'
""
""        let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
""        let g:Tex_CompileRule_ps = 'dvips -Pwww -o $*.ps $*.dvi'
""        let g:Tex_CompileRule_pspdf = 'ps2pdf $*.ps'
""        let g:Tex_CompileRule_dvipdf = 'dvipdfm $*.dvi'
"         let g:Tex_CompileRule_pdf = 'pdflatex -synctex=1 --interaction=nonstopmode $*'
"
""        let g:Tex_ViewRule_dvi = 'texniscope'
""        let g:Tex_ViewRule_ps = 'Preview'
"        let g:Tex_ViewRule_pdf = 'Skim'
"
""        let g:Tex_FormatDependency_ps  = 'dvi,ps'
""        let g:Tex_FormatDependency_pspdf = 'dvi,ps,pspdf'
""        let g:Tex_FormatDependency_dvipdf = 'dvi,dvipdf'
    elseif (has("win32"))
        let g:vimtex_view_method = "C:\\Program Files (x86)\\Adobe\\Reader 11.0\\Reader\\AcroRd32.exe"
    else
        let g:vimtex_view_method="zathura"
    endif

    "let g:vimtex_view_general_viewer = 'okular'
    "let g:vimtex_view_general_options = '--unique @pdf\#src:@line@tex'
    "let g:vimtex_view_general_options_latexmk = '--unique'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    noremap <Leader>wn :call WhiteSpace()<CR>

    hi ExtraWhitespace cterm=NONE ctermbg=green ctermfg=green guibg=green guifg=green
    hi link MaybeExtraWhitespace ExtraWhitespace

    match MaybeExtraWhitespace /\s\+\%#\@<!$/
    au InsertEnter * match MaybeExtraWhitespace /\s\+\%#\@<!$/
    au InsertLeave * match MaybeExtraWhitespace /\s\+\%#\@<!$/

    let g:hilightws = 1

    function! WhiteSpace()
        if g:hilightws
            highlight link MaybeExtraWhitespace NONE
            let g:hilightws = 0
            echo "Whitespace Highlighting On"
        else
            highlight link MaybeExtraWhitespace ExtraWhitespace
            let g:hilightws = 1
            echo "Whitespace Highlighting Off"
        endif
    endfunction

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
        autocmd!
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

    augroup verilog

        autocmd!
        autocmd BufNewFile,BufReadPost *.v set filetype=verilog

        " use width=2 tabs in verilog for Kubic-Kompatible-Kode
        autocmd FileType verilog setlocal tabstop=2 softtabstop=2 shiftwidth=2
    augroup END

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

    let g:softwrap = 0

    function ToggleWrap()
        if g:softwrap
            let g:softwrap=0
            echo "Disabling Softwrapping"
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
            let g:softwrap=1
            "Wrap ON"
            echo "Enabling Softwrapping"
            setlocal wrap linebreak nolist

            if (!hostname()=='ucla-cms-pc' && !has("win32"))
                setlocal breakindent
            endif

            "set virtualedit=
            "setlocal display+=lastline
            noremap  <buffer> <silent> <Up>   gk
            noremap  <buffer> <silent> <Down> gj
            inoremap <buffer> <silent> <Up>   <C-o>gk
            inoremap <buffer> <silent> <Down> <C-o>gj

            noremap  <buffer> <silent> <Home> g<Home>
            noremap  <buffer> <silent> <End>  g<End>
            inoremap <buffer> <silent> <Home> <C-o>g<Home>
            inoremap <buffer> <silent> <End>  <C-o>g<End>

            noremap  <buffer> <silent> k  gk
            noremap  <buffer> <silent> j  gj
        endif
    endfunction

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

    :set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../tags,tags

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
        //let Tlist_Ctags_Cmd = 'C:\ctags.exe'
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
"When executing the map command, Vim will replace "<SID>" with the special
"key code <SNR>, followed by a number that's unique for the script, and an
"underscore.  Example:
"    :map <SID>Add
"could define a mapping "<SNR>23_Add".

augroup insertgates
    autocmd!
    autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()
augroup END


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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hidden Characters
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Invisible guifg=bg guibg=bg

" hide ^M from line endings
match Invisible /\r$/

"match Ignore /\s\+$/



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoread
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set autoread


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd BufRead,BufNewFile *.md set filetype=markdown

if system('uname -s') == "Darwin\n"
    autocmd BufNewFile,BufRead,FileReadPost *.md :MarkedOpen
    "autocmd BufNewFile,BufRead,FileReadPost *.md :set background=light
    "autocmd BufNewFile,BufRead,FileReadPost *.md :colorscheme PaperColor
else

endif

" let g:vim_markdown_fenced_languages = ['cpp', 'ruby', 'json', 'verilog']
" autocmd ColorScheme * highlight link githubFlavoredMarkdownCode CursorLine

"augroup markdown
"    " Markdown (no need for modula2 :)
"
"
"    autocmd FileType markdown set wrap linebreak nolist
"    autocmd FileType markdown set textwidth=0
"    autocmd FileType markdown set wrapmargin=0
"    autocmd FileType markdown nmap <leader>m :silent !open %<CR>
"    " http://vim.wikia.com/wiki/All_folds_open_when_opening_a_file
"    " http://stackoverflow.com/questions/5074191/vim-fold-top-level-folds-only
"    autocmd FileType markdown normal %foldc
"augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" j k as escape
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap jk <Esc>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ROOT
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup root
    autocmd!

    autocmd BufNewFile,BufReadPost *.C set filetype=cpp

    autocmd filetype cpp nnoremap <buffer> <leader>th1f oTH1F* h1 = new TH1F ("name", "title",  nbinsx, xlow, xhigh);<ESC>
    autocmd filetype cpp nnoremap <buffer> <leader>th2f oTH2F* h2 = new TH2F ("name", "title",  nbinsx, xlow, xhigh, nbinsy, ylow, yhigh);
    autocmd filetype cpp nnoremap <buffer> <leader>th1d oTH1D* h1 = new TH1D ("name", "title",  nbinsx, xlow, xhigh);<ESC>
    autocmd filetype cpp nnoremap <buffer> <leader>th2d oTH2D* h2 = new TH2D ("name", "title",  nbinsx, xlow, xhigh, nbinsy, ylow, yhigh);
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Show Commands In Progress
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showcmd
set list
"set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set listchars=tab:→\ ,extends:›,precedes:‹,nbsp:·,trail:·
"set showbreak=↪\
"set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨


if isdirectory($ROOTSYS.'/include')
    set path+=$ROOTSYS/include
endif

let g:ale_cpp_clang_options='-std=c++14 -Wall -I/Users/andrew/root/include'
let g:ale_cpp_clangtidy_options='-std=c++14 -Wall -I$ROOTSYS/include'

let g:ale_linters = { 'cpp': ['clang']}

function! s:update_fzf_colors()
  let rules =
  \ { 'fg':      [['Normal',       'fg']],
    \ 'bg':      [['Normal',       'bg']],
    \ 'hl':      [['Comment',      'fg']],
    \ 'fg+':     [['CursorColumn', 'fg'], ['Normal', 'fg']],
    \ 'bg+':     [['CursorColumn', 'bg']],
    \ 'hl+':     [['Statement',    'fg']],
    \ 'info':    [['PreProc',      'fg']],
    \ 'prompt':  [['Conditional',  'fg']],
    \ 'pointer': [['Exception',    'fg']],
    \ 'marker':  [['Keyword',      'fg']],
    \ 'spinner': [['Label',        'fg']],
    \ 'header':  [['Comment',      'fg']] }
  let cols = []
  for [name, pairs] in items(rules)
    for pair in pairs
      let code = synIDattr(synIDtrans(hlID(pair[0])), pair[1])
      if !empty(name) && code > 0
        call add(cols, name.':'.code)
        break
      endif
    endfor
  endfor
  let s:orig_fzf_default_opts = get(s:, 'orig_fzf_default_opts', $FZF_DEFAULT_OPTS)
  let $FZF_DEFAULT_OPTS = s:orig_fzf_default_opts .
        \ empty(cols) ? '' : (' --color='.join(cols, ','))
endfunction

augroup _fzf
  autocmd!
  autocmd ColorScheme * call <sid>update_fzf_colors()
augroup END

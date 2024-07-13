  " window-variable    w:    Local to the current window.
  " tabpage-variable   t:    Local to the current tab page.
  " global-variable    g:    Global.
  " local-variable     l:    Local to a function.
  " script-variable    s:    Local to a |:source|'ed Vim script.
  " function-argument  a:    Function argument (only inside a function).
  " vim-variable       v:    Global, predefined by Vim.

  "" TODO:
  "" 1) "" send todo + fixme to the quickfix
  "" :cexpr system('git grep --line-number -e fixme -e todo')
  "" :copen

  "" 2) https://dev.to/konstantin/find-and-replace-text-in-project-files-with-vim-jga
    " To search text within project files simply type :Rg <text>. This will open up a FZF buffer with a list of files.
    " Then with a Tab key you can select/deselect files that you want to pass to quickfix window. To select all files tap Alt/¿-a and to deselect Alt/¿-d.
    " Once your selection is ready hit Enter to pass selected files to quickfix buffer.
    " Now you can replace text in all files within quickfix buffer with :cfdo %s/<text to search>/<text to replace with>/g | update.

    "" 3) VHDL / Verilog perl plugins
    " https://www.ece.ucdavis.edu/~jwwebb/ee/digital/hdl_design.html.orig

  "
  filetype plugin indent on    " required
  filetype plugin on

  set noerrorbells
  set nocompatible
  set encoding=utf-8
  set termguicolors

  if has("gui_macvim")
      let macvim_skip_cmd_opt_movement = 1
  endif

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Packages
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  call plug#begin()


  Plug 'SirVer/ultisnips'
  Plug 'airblade/vim-gitgutter'
 "Plug 'mhinz/vim-signify'
  Plug 'godlygeek/tabular'
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'junegunn/vim-peekaboo'
  Plug 'justinmk/vim-gtfo'
  Plug 'MTDL9/vim-log-highlighting'
 "Plug 'ludovicchabant/vim-gutentags'
  Plug 'mbbill/undotree'
  Plug 'scrooloose/nerdcommenter'
  Plug 'thirtythreeforty/lessspace.vim'
  Plug 'vim-scripts/a.vim'        " A to switch between .c and .h
  Plug 'vim-scripts/taglist.vim'
  Plug 'w0rp/ale'
 "Plug 'Yggdroot/indentLine'
 "Plug 'ervandew/supertab'


  " Better % and * matching
  Plug 'tmhedberg/matchit'
  Plug 'andymass/vim-matchup'

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Conflict Motions
  Plug 'vim-scripts/ConflictMotions' " ConflictMotions
  Plug 'vim-scripts/CountJump'    " needed by ConflictMotions
  Plug 'vim-scripts/ingo-library' " needed by ConflictMotions

  " FZF
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'pbogut/fzf-mru.vim'

  " Tim Pope
  Plug 'tpope/vim-eunuch'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'tpope/vim-abolish'
 "Plug 'tpope/vim-sleuth'

  " Languages
  Plug 'vhda/verilog_systemverilog.vim'
  Plug 'vim-scripts/VIP' " Special copy paste for VHDL
  Plug 'lervag/vimtex'
  Plug 'JuliaEditorSupport/julia-vim'
  Plug 'gabrielelana/vim-markdown'
  Plug 'jceb/vim-orgmode'

 "Colorschemes
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'chriskempson/base16-vim'
  Plug 'dmcgrady/vim-lucario'
  Plug 'dracula/vim'
  Plug 'guns/jellyx.vim'
  Plug 'zeis/vim-kolor'
  Plug 'lifepillar/vim-solarized8'
  Plug 'morhetz/gruvbox'
  Plug 'patstockwell/vim-monokai-tasty'
  Plug 'iCyMind/NeoSolarized'

  Plug 'liuchengxu/vim-which-key'

  nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

  ""if (!(has("win32")))
  ""  Plug 'Valloric/YouCompleteMe'
  ""  "let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
  ""  "map <silent> <Leader>f :YcmCompleter FixIt<CR>
  ""endif

call plug#end()

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " GTFO
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  let g:gtfo#terminals = { 'unix': 'terminator --working-dir=' }

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " TagList
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  nmap <silent> <Leader>tl :TlistToggle<CR>
  let g:Tlist_WinWidth = 60

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Keybindings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  nnoremap <A-x>         :Commands<CR>

  map <silent> <Space>bb :!~/bin/vhdl-beautify %<CR>

  map <silent> <Space>gg :Gstatus<CR>
  map <silent> <Space>gS :Gwrite<CR>
  map <silent> <Space>fr :FZFMru<CR>
  map <silent> <Space>b  :Buffers<CR>
  map <silent> <Space>fp :Files ~/.dotfiles<CR>

  map <silent> <C-p> :GFiles<CR>
  map <silent> <C-o> :Files ~/<CR>
  map <silent> <C-n> :Files ~/Dropbox/notes<CR>
  map <silent> <Leader>tt :Tags<CR>
  map <silent> <Leader>f  :Files ~/<CR>
  map <silent> <Leader>g  :GGrep<CR>
  map <silent> <Leader>rr :FZFMru<CR>
  map <silent> <Leader>rg :Rg<CR>
  map <silent> <Leader>b  :Buffers<CR>

  " M-q to fill paragraph a la emacs
  nnoremap q vipgq
  vnoremap q vipgq

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " FZF
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " 'rg -g "" --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg -g "" --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'},'up:60%')
    \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'},'right:50%'),
    \   <bang>0)


  " - fzf#vim#grep(command, with_column, [options], [fullscreen])
  "command! -bang -nargs=* GGrep
  "  \ call fzf#vim#grep('cd `git rev-parse --show-toplevel` && git grep --line-number . && cd -', 0, <bang>0)

  " command! -bang -nargs=* GGrep
  "   \ call fzf#vim#grep(
  "   \   'git grep --line-number . -- :/ '.shellescape(<q-args>), 0,
  "   \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 3..'},'up:60%')
  "   \           : fzf#vim#with_preview({'options': '--delimiter : --nth 3..'},'right:50%'),
  "   \   <bang>0)

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

  if (has("win32"))
    let g:fzf_colors =
          \ { 'fg':      ['fg', 'Normal'],
          \   'bg':      ['bg', 'Normal'],
          \   'hl':      ['fg', 'Comment'],
          \   'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
          \   'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
          \   'hl+':     ['fg', 'Statement'],
          \   'info':    ['fg', 'PreProc'],
          \   'border':  ['fg', 'Ignore'],
          \   'prompt':  ['fg', 'Conditional'],
          \   'pointer': ['fg', 'Exception'],
          \   'marker':  ['fg', 'Keyword'],
          \   'spinner': ['fg', 'Label'],
          \   'header':  ['fg', 'Comment'] }
  endif

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Git Gutter
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  let g:gitgutter_max_signs = 2000  " default value
  set updatetime=250
  nmap <Leader>gg :GitGutterToggle<CR>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Ultisnips
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  "set runtimepath+="~/Dropbox/System Files/vim/.vim/UltiSnips"
  "let g:UltiSnipsSnippetsDir="~/Dropbox/System Files/vim/.vim/UltiSnips/"
  "let g:UltiSnipsSnippetDirectories = [$HOME.'/Dropbox/System Files/vim/.vim/UltiSnips']

  "let g:UltiSnipsExpandTrigger = "<c-c>"
  "let g:UltiSnipsJumpForwardTrigger       =  "<c-j>"
  "let g:UltiSnipsJumpBackwardTrigger      =  "<c-k>"
  let g:UltiSnipsExpandTrigger = "<nop>"
  let g:ulti_expand_or_jump_res = 0
  function! ExpandSnippetOrCarriageReturn()
      let snippet = UltiSnips#ExpandSnippetOrJump()
      if g:ulti_expand_or_jump_res > 0
          return snippet
      else
          return "\<CR>"
      endif
  endfunction
  inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"

  let g:ycm_key_list_select_completion = ['<tab>', '<Down>']
  let g:ycm_key_list_previous_completion = ['<s-tab>', '<Up>']

  "let g:UltiSnipsJumpForwardTrigger="<c-b>"
  "let g:UltiSnipsJumpBackwardTrigger="<c-z>"

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Tabularize
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  map <silent> <Leader>= :Tabularize/^[^=]*\zs=/l1<CR>
  map <silent> <Leader>( :Tabularize/^[^(]*\zs (/l0<CR>
  map <silent> <Leader>/ :Tabularize/\(^\s*\)\@<!\/\//l1<CR>
  map <silent> <Leader>T :Tabularize/\ \| <CR>
 "map <silent> <Leader>/ :Tabularize/\(^\s*\|\/\/.*\)\@<!\/\//l1<CR>
 "map <silent> <Leader>/ :Tabularize/[^\/\/]\/\//l1<CR>
  map <silent> <Leader>[ :Tabularize/ [/l0<CR>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " airline
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
  let g:airline#extensions#tabline#fnamemod = ':t' " Show just the filename
  let g:airline_theme = 'papercolor'

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " netrw file explorer
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  "leader e to open netrw
  "nmap <silent> <Leader>e :Explore<CR>

  "hide the giant banner at the top of netrw
  let g:netrw_banner=0
  " hide gitignored files from netrw
  " if !has("win32")
  " let g:netrw_list_hide=netrw_gitignore#Hide()
  " endif

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " C++ Syntax Highlighting for Arduino .ino files
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  augroup arduino
    autocmd!
    autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp
    autocmd BufNewFile,BufReadPost *.inc       set filetype=cpp
  augroup END


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " XCI
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  augroup xci
    autocmd!
    autocmd BufNewFile,BufReadPost *.xci set filetype=tcl
  augroup END

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " trailing whitespace
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen

  "Delete trailing whitespace with <Leader>rtw
  nnoremap <Leader>rtw mz:%s/\s\+$//e<CR>`z
  " Delete trailing whitespace with <Leader>rtw
  nnoremap <Leader>rm mz:%s///g<CR>`z
  " Show trailing whitespace:
  match ExtraWhitespace /\s\+$/
  " Show trailing whitespace and spaces before a tab:
  match ExtraWhitespace /\s\+$\| \+\ze\t/
  " Show tabs that are not at the start of a line:
  match ExtraWhitespace /[^\t]\zs\t\+/

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "better tab navigation
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " new tab
  nnoremap <C-A-t>         :tabnew<CR>
  inoremap <C-A-t>    <Esc>:tabnew<CR>

  " tab next/prev
  inoremap <C-Tab>>>  <Esc>:tabnext<CR>i
  nnoremap <C-Tab>         :tabnext<CR>
  inoremap <C-S-Tab>  <Esc>:tabprevious<CR>i
  nnoremap <C-S-Tab>       :tabprevious<CR>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "easier manual indentation
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " rehighlight the same block of characters after indenting
  vnoremap > >gv
  vnoremap < <gv

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " better line moving
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  nnoremap <A-Down>       :m .+1<CR>
  nnoremap <A-Up>         :m .-2<CR>
  inoremap <A-Down> <Esc> :m .+1<CR>gi
  inoremap <A-Up>   <Esc> :m .-2<CR>gi
  vnoremap <A-Down>       :m '>+1<CR>gv
  vnoremap <A-Up>         :m '<-2<CR>gv

  nnoremap <M-Down>       :m .+1<CR>
  nnoremap <M-Up>         :m .-2<CR>
  inoremap <M-Down> <Esc> :m .+1<CR>gi
  inoremap <M-Up>   <Esc> :m .-2<CR>gi
  vnoremap <M-Down>       :m '>+1<CR>gv
  vnoremap <M-Up>         :m '<-2<CR>gv

  "nnoremap <A-Down>      :m .+1<CR>==
  "nnoremap <A-Up>        :m .-2<CR>==
  "inoremap <A-Down> <Esc>:m .+1<CR>==gi
  "inoremap <A-Up>   <Esc>:m .-2<CR>==gi
  "vnoremap <A-Down>      :m '>+1<CR>gv=gv
  "vnoremap <A-Up>        :m '<-2<CR>gv=gv

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " undo
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  nnoremap <F5> :UndotreeToggle<cr>

  "nmap <silent> <Leader>u :UndotreeToggle<CR>

  set undofile
  if has("win32")
    set undodir=C:/Dropbox/.vim/undodir
  else
    set undodir=~/Dropbox/.vim/undodir
  endif

  set history=2000
  set undolevels=2000

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Text Width
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  "set colorcolumn=120
  "set tw=120

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " smaller hardcopy printed fonts
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  set printfont=Courier:h7
  set printoptions=paper:letter,syntax:y,wrap:y,number:y,portrait:n,left:0.1in,right:0.1in,top:0.1in,bottom:0.1in,header:0

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Font
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " nvim doesn't support guifont...
  if (!has("nvim"))
    if has("win32")
      "let Tlist_Ctags_Cmd = 'C:\ctags.exe'
      set guifont=Consolas:h10
    elseif hostname()=='ucla-cms-pc'
      set guifont=DejaVu\ Sans\ Mono\ 10
    elseif system('uname -s') == "Darwin\n"
      set guifont=Menlo:h14
    else
      set guifont=DejaVu\ Sans\ Mono\ 10,Monofur\ Bold\ 10,Monospace\ 9,Source\ Code\ Pro\ 9,Inconsolata\ 9,Consolas\ 9
    endif
  endif

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Theme
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  set background=light
  silent! colorscheme summerfruit256

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "Formatting
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  syntax on
  "set nocursorcolumn
  "set cursorcolumn
  "set cursorline
  set foldcolumn=1
  "hi FoldColumn guifg=grey guibg=ctermbg

  "    "gruvbox
  "    if (g:colors_name=="gruvbox")
  "        hi CursorLine   term=bold ctermfg=NONE guifg=NONE ctermbg=black guibg=black
  "        hi CursorColumn term=bold ctermfg=NONE guifg=NONE ctermbg=black guibg=black
  "    elseif (g:colors_name=="summerfruit256")
  "        "summerfruit
  "        hi CursorLine   term=bold ctermfg=NONE guifg=NONE ctermbg=NONE  guibg=#F4F4F4
  "        hi CursorColumn term=bold ctermfg=NONE guifg=NONE ctermbg=NONE  guibg=#F4F4F4
  "    elseif (g:colors_name=="PaperColor")
  "        "summerfruit
  "        hi CursorLine   term=bold ctermfg=NONE guifg=NONE ctermbg=white  guibg=black
  "        hi CursorColumn term=bold ctermfg=NONE guifg=NONE ctermbg=NONE  guibg=black
  "        ""if (set background ?) = "background=dark")
  "        "    highlight Cursor  guifg=white guibg=black
  "        "    highlight iCursor guifg=white guibg=black
  "        "else
  "        highlight Cursor  guifg=white guibg=darkgreen
  "        highlight iCursor guifg=white guibg=white
  "        "endif
  "    endif

  syntax sync minlines=256
  set t_Co=256

  "highlight iCursor guifg=white guibg=steelblue " steelblue was nice on gruvbox
  set guicursor=n-v-c:block-Cursor
  set guicursor+=n-v-c:blinkon0
  set guicursor+=i:blinkwait10
  set guicursor+=i:ver25-iCursor

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " folding settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  set foldmethod=indent " fold based on indent
  set foldnestmax=4     " deepest fold is 10 levels
  set nofoldenable      " dont fold by default
  set foldlevel=99      " this is just what i use

  " <2-LeftMouse>     Open fold, or select word or % match.
  nnoremap <expr> <2-LeftMouse> foldclosed(line('.')) == -1 ? "\<2-LeftMouse>" : 'zo'
  " nnoremap <Tab> zo

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Comment Insertion
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  augroup commentinsertion

    autocmd!

    " comment insertion for C family and Verilog
    autocmd BufRead,BufNewFile *.c,*.cpp,*.h,*.v nmap <silent> <buffer> <leader>C o//<ESC>80A-<ESC>081\|DyypO// <ESC>
    autocmd BufRead,BufNewFile *.c,*.cpp,*.h,*.v nmap <silent> <buffer> <leader>c o//<ESC>80A-<ESC>081\|D0w

    " Vimrc
    autocmd BufRead,BufNewFile *.vimrc           nmap <silent> <buffer> <leader>C o<ESC>0i""<ESC>80A"<ESC>081\|DyypO" <ESC>

    " VHDL
    autocmd BufRead,BufNewFile *.vhdl,*.vhd nmap <silent> <buffer> <leader>C o--<ESC>80A-<ESC>081\|DyypO-- <ESC>
    autocmd BufRead,BufNewFile *.vhdl,*.vhd nmap <silent> <buffer> <leader>c o--<ESC>80A-<ESC>081\|D0w

  augroup end

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " disable auto comment continuation
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  augroup commentcontinuation
    autocmd!
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
  augroup END

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " LaTeX
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  au FileType tex setlocal nocursorline
  au FileType tex setlocal spell
  au FileType tex call SetWrap()

  "vim latex variables
  " LaTeX (rubber) macro for compiling
  "nnoremap <leader>c :w<CR>:!rubber --pdf --warn all %<CR>
  " View PDF macro; '%:r' is current file's root (base) name.
  "nnoremap <leader>v :!atril %:r.pdf &<CR><CR>

  set grepprg=grep\ -nH\ $*

  let g:tex_flavor = "latex"

  if (has("win32"))
    let g:vimtex_view_method = "C:\\Program Files (x86)\\Adobe\\Reader 11.0\\Reader\\AcroRd32.exe"
  elseif (system('uname -s') == "Darwin\n")
    let g:Tex_ViewRule_pdf = 'open -a Skim'
    " ,ls to forward search
    map <leader>ls :w<CR>:silent !/Applications/Skim.app/Contents/SharedSupport/displayline -r <C-r>=line('.')<CR> %<.pdf %<CR><CR>
  else
    let g:vimtex_view_general_viewer = 'okular'
  endif

  let g:Tex_CompileRule_pdf = "latexmk -pdflatex='pdflatex -file-line-error -synctex=1 -interaction=nonstopmode' -bibtex -pdf $*"
  " Change default target to pdf, if not dvi is used
  let g:Tex_DefaultTargetFormat = 'pdf'

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Whitespace
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  noremap <Leader>wn :call WhiteSpace()<CR>

  hi ExtraWhitespace cterm=NONE ctermbg=green ctermfg=green guibg=green guifg=green
  hi link MaybeExtraWhitespace ExtraWhitespace

  match MaybeExtraWhitespace /\s\+\%#\@<!$/
  ""au InsertEnter * match MaybeExtraWhitespace /\s\+\%#\@<!$/
  ""au InsertLeave * match MaybeExtraWhitespace /\s\+\%#\@<!$/

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

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Spelling Settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  set nospell

  "if has("spell")
  "    "Turn on Spell check (us english)
  "    setlocal spell spelllang=en_us
  "    "highlight clear SpellBad
  "    "highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline,bold
  "    "highlight clear SpellCap
  "    "highlight SpellCap term=underline cterm=underline
  "    "highlight clear SpellRare
  "    "highlight SpellRare term=underline cterm=underline
  "    "highlight clear SpellLocal
  "    "highlight SpellLocal term=underline cterm=underline
  "    "nn :setlocal spell! spelllang=en_us
  "    "imap :setlocal spell! spelllang=en_us
  "endif

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " window title
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

  set title

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "tab settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  "set smarttab
  set expandtab
  set shiftround " >> << keys move to multiple values of shiftwidth

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " search options
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  set showmatch
  set matchtime=3
  set incsearch
  set hlsearch
  set ignorecase
  set smartcase

  "escape clears highlighted search terms
  " for some reason this causes terminal vim
  "nnoremap <ESC> :noh<CR><ESC>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " better soft wrapping
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  "Allows for <LEADER>+w to enable and disable soft word-wrapping
  "With word wrap turned on, the arrow keys correspond to gj gk
  "allowing us to move through visual lines
  noremap <silent> <Leader>w :call ToggleWrap()<CR>

  let g:softwrap = 0
  set nowrap

  function! SetNoWrap()
      let g:softwrap=0
      " echo "Disabling Softwrapping"
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
  endfunction

  function! SetWrap()
      let g:softwrap=1
      "Wrap ON"
      " echo "Enabling Softwrapping"
      setlocal wrap linebreak nolist

      if (!has("win32"))
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
  endfunction

  function! ToggleWrap()
      if g:softwrap
          call SetNoWrap()
      else
          call SetWrap()
      endif
  endfunction

  call SetNoWrap()

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Windows Settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  if has("win32")
      "let Tlist_Ctags_Cmd = 'C:\ctags.exe'
  endif

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Mouse block selection
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  noremap  <M-LeftMouse> <4-LeftMouse>
  inoremap <M-LeftMouse> <4-LeftMouse>
  onoremap <M-LeftMouse> <C-C><4-LeftMouse>
  noremap  <M-LeftDrag>  <LeftDrag>
  inoremap <M-LeftDrag>  <LeftDrag>
  onoremap <M-LeftDrag>  <C-C><LeftDrag>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Change Backup File behavor
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "  Produce header guard when creating new header files
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Magic increment
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  function! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
      execute 'normal! '.c.'|'.a."\<C-a>"
    endif
    normal `<
  endfunction
  vnoremap <C-a> :call Incr()<CR>

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Wrap at 120 characters, but don't insert stupid linebreaks
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  "set tw=120
  set linebreak
  set nolist
  set wrapmargin=0
  set formatoptions-=t

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Hidden Characters
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  highlight Invisible guifg=bg guibg=bg
  " hide ^M from line endings
  match Invisible /\r$/
  "match Ignore /\s\+$/

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Markdown
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  augroup markdown
    autocmd!
    autocmd BufRead,BufNewFile *.md set filetype=markdown
    autocmd FileType markdown set nocursorcolumn
    autocmd FileType markdown set nocursorline
    autocmd FileType markdown call SetWrap()
    autocmd FileType markdown setlocal cc=
  augroup END

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " ROOT
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  augroup root
    autocmd!
    autocmd BufNewFile,BufReadPost *.C set filetype=cpp
  augroup END

  if isdirectory($ROOTSYS.'/include')
    set path+=$ROOTSYS/include
  endif

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Ale
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  let g:ale_cpp_clang_options='-std=c++14 -Wall -I/Users/andrew/root/include'
  let g:ale_cpp_clangtidy_options='-std=c++14 -Wall -I$ROOTSYS/include'
  let g:ale_linters = { 'cpp': ['clang']}
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '⚠'

  highlight ALEErrorSign   guibg=#438ec3 ctermbg=NONE ctermfg=red
  highlight ALEWarningSign guibg=#438ec3 ctermbg=NONE ctermfg=yellow
  highlight signcolumn     guibg=#438ec3

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Signify
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  highlight SignifySignAdd    guibg=#438EC3 ctermfg=green    guifg=#ffffff cterm=bold gui=bold
  highlight SignifySignDelete guibg=#438EC3 ctermfg=red      guifg=#ffffff cterm=bold gui=bold
  highlight SignifySignChange guibg=#438EC3 ctermfg=yellow   guifg=#ffffff cterm=bold gui=bold

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Python
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  if (has("nvim"))
    let g:python_host_prog  = '/usr/local/bin/python2'
    let g:python3_host_prog = '/usr/local/bin/python3'

    " make neovim check for updated files
    set inccommand=nosplit
    set autoread
    au FocusGained * :checktime
  endif

  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  " Misc Settings
  """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  nnoremap <Y> y$

  " backspace in normal mode to jump to last used buffer
  nnoremap <BS> <C-^>

  " Show Commands In Progress
  set showcmd
  set nolist

  " Show special characters
  set listchars=tab:\ \ ,trail:·,eol:¬,nbsp:_

  " center screen on search result
  nnoremap n nzz

  " Dont indent Access Specifiers in C++
  "set cinoptions+=g0

  "encryption
  if (!has("nvim"))
    set cryptmethod=blowfish2
  endif

  "ignore whitespace in vimdiff
  "set diffopt+=iwhite

  "better tab completion
  set wildmode=longest,list,full
  set wildmenu

  " have ctags look in higher directories
  :set tags=./tags,./../tags,./../../tags,./../../../tags,./../../../tags,./../../../../tags,tags

  " turn on ruler
  set ruler

  " Allow saving of files as sudo when I forgot to start vim using sudo.
  cmap w!! w !sudo tee > /dev/null %

  " set leader key
  ":let mapleader = ","

  " Change maximum number of tabs
  set tabpagemax=100

  " paste mode toggle
  set pastetoggle=<F3>

  " turn on mouse
  set mouse=a

  " Change splitting position
  set splitbelow
  set splitright

  " Allow virtual highlighting in visual block mode
  set virtualedit=block

  " When joining lines, set a mark to return to afterwards
  nnoremap J mzJ`z

  " Sets F2 to enable and disable line numeration
  set nu!
  nnoremap <F2> :set nonumber!<CR>

  " The time in milliseconds that is waited for a key code or mapped key
  " sequence to complete.  Also used for CTRL-\ CTRL-N and CTRL-\ CTRL-G
  " when part of a command has been typed.
  set ttimeoutlen=50

  "always show status line
  set laststatus=2

  " better $ matching
  runtime macros/matchit.vim

  " scrolling offset
  set scrolloff=5

  " use the unnamed (system) clipboard as the default yank buffer
  set clipboard=unnamedplus

  " Better backspace behavior
  set backspace=eol,start,indent

  " In insert mode, C-BS to delete previous word, and C-DEL to delete next
  imap <C-BS>  <C-W>
  imap <C-DEL> <ESC>ldei

  " Add Underscore as Word Bounder
  "set iskeyword-=_

  " Autoread Changd Files
  " check one time after 4s of inactivity in normal mode
  set autoread
  au CursorHold * checktime

  " Turn off annoying middle mouse paste
  map  <MiddleMouse> <Nop>
  imap <MiddleMouse> <Nop>

  "
  let g:netrw_localrmdir='rm -r'

  " Scrollbars
  set guioptions-=r  "remove right-hand scroll bar
  set guioptions-=L  "remove left-hand scroll bar
  set guioptions-=T  "remove toolbar
  "set guioptions-=m  "remove menu bar

  " Match Colors
  hi MatchParen cterm=bold ctermbg=none ctermfg=none

  "parenthesis match options
  ":hi MatchParen cterm=none ctermbg=black ctermfg=white

  " Diff colors
  hi DiffAdd      gui=none       guifg=NONE     guibg=#bada9f
  hi DiffChange   gui=none       guifg=NONE     guibg=NONE
  hi DiffDelete   gui=bold       guifg=#ff8080  guibg=#ffb0b0
  hi DiffText     gui=underline  guifg=NONE     guibg=#e5d5ac

  augroup todo
      autocmd!
      autocmd Syntax * call matchadd(
                  \ 'Debug',
                  \ '\v\W\zs<(NOTE|INFO|IDEA|TODO|FIXME|CHANGED|XXX|BUG|HACK|TRICKY)>'
                  \ )
  augroup END

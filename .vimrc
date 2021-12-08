" Operating System specific settings
if has("win32") || has("win16")
    set backupdir=~/vimfiles/backup
    set dir=~/vimfiles/temp
    set undodir=~/vimfiles/undo
    "Insert date/timestamp in normal mode
    nnoremap <F5> "=strftime("%m/%d/%Y %I:%M:%S %p")<CR>P
    "Insert date/timestamp in insert mode
    inoremap <F5> <C-R>=strftime("%m/%d/%Y %I:%M:%S %p")<CR>
    "Execute current script in python
    nnoremap <silent> <F4> :!python %<CR>
    "This mapping is for MS Windows to increment numbers. This is normally done with Control+A in Unix.
    "Edit - for some reason this remap doesn't work, maybe the mswin.vim overrides the behavior. It works if setting ':nnoremap <A-a> <C-a>' manually.
    nnoremap <A-a> <C-a>
    "This mapping is for MS Windows to decrement numbers. This is normally done with Control+X in Unix.
    nnoremap <A-x> <C-x>
else
    let os = substitute(system('uname'), "\n", "", "")
    set backupdir=~/.vim/backup
    set dir=~/.vim/temp
    set undodir=~/.vim/undo
    if os == "OpenBSD"
        " Do OpenBSD-specific stuff.
        nnoremap <silent> <F4> :!clear;python2.7 %<CR>
    "elseif os == \"Linux"
        " Do Linux-specific stuff.
    endif
endif

" GUI specific settings
if has("gui_running")
    " Microsoft Windows configuration (gvim)
    colorscheme herald
    set guifont=Source_Code_Pro:h9:cANSI
    set guioptions+=rl "set right and left side window scrollbars
    set guioptions-=T "set remove toolbar
    source $VIMRUNTIME/mswin.vim
else
    " Set hotkey to launch Python code currently being edited. May need to change python executible per environment.
    source $VIMRUNTIME/menu.vim
endif


syntax on
set undofile
set wrap
set autoread "Reload files changed outside vim
set bk "set backup
set encoding=utf-8
set visualbell
"set listchars=tab:>~,nbsp:_,trail:.
"set listchars=tab:â–¸\ ,nbsp:_,trail:Â·

" so invisibles
set list
set listchars=
set listchars+=tab:>\ 
set listchars+=trail:·
set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:.

"This section is for general vim settings
set nocompatible "This fixes the problem where arrow keys do not function properly on some systems.
set ruler
set nu "Enables line numbering
"Toggle relative numbering
autocmd InsertLeave * :set norelativenumber
autocmd InsertEnter * :set relativenumber

" lazy file name tab completion
set wildmode=longest,list,full
" Try wildmenu with ':h wi[tab]'
set wildmenu
set wildignorecase
" ignore files vim doesnt use
set wildignore+=.git,.hg,.svn
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.rbc,*.class
set wildignore+=*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp
set wildignore+=*.avi,*.divx,*.mp4,*.webm,*.mov,*.m2ts,*.mkv,*.vob,*.mpg,*.mpeg
set wildignore+=*.mp3,*.oga,*.ogg,*.wav,*.flac
set wildignore+=*.eot,*.otf,*.ttf,*.woff
set wildignore+=*.doc,*.pdf,*.cbr,*.cbz
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz,*.kgb
set wildignore+=*.swp,.lock,.DS_Store,._*

" case insensitive search
set ignorecase
set smartcase
set infercase
" the /g flag on :s substitutions by default
set gdefault
set cursorline
set cursorcolumn

" disable startup message
"set shortmess+=I

" Try hlsearch with quicksearch '/w'
set hlsearch
set history=10000
set incsearch

" Tabs and spacing:
set autoindent
set ch=2 "set cmdheight Number of screen lines to use for the command-line. default=1
set ts=4 "set tabstop Number of spaces that a <Tab> in the file counts for. default=8
set sw=4 "set Number of spaces to use for each step of (auto)indent. default=8
set bs=2 "set backspace Same as :set backspace=indent,eol,start. default=""

set si "set smartindent Do smart autoindenting when starting a new line. default=off
set sta  "set smarttab Improves tabbing. default=off
set sts=4 "set softtabstop makes the spaces feel like real tabs. default=0
set et "set expandtab In Insert mode: Use the appropriate number of spaces to insert a <Tab>. default=off

set sm  "set showmatch Highlights matching brackets in programming languages

" Working with Python:
autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class

" Insert timestamp: press <F5>. This displays the same across OSes. Previously used: %c as the full string.
"nnoremap <F5> =strftime("%m/%d/%Y %I:%M:%S %p")<CR>P
"inoremap <F5> <C-R>=strftime("%m/%d/%Y %I:%M:%S %p")<CR>

" Insert a text page break for notes and visual segmentation:
<<<<<<< HEAD
:ia -- ____________________________________________________________________________<CR><CR>
:ia s- ____________________________________________________________________________<CR><C-R>=strftime("%m/%d/%Y %I:%M:%S %p")<CR><CR>
:ia S- ____________________________________________________________________________<CR><C-R>=strftime("%m/%d/%Y %I:%M:%S %p")<CR><CR>
=======
:ia s- ____________________________________________________________________________
>>>>>>> parent of e907e0c... Update .vimrc

" Open any file with a pre-existing swapfile in readonly mode:

    augroup NoSimultaneousEdits
        autocmd!
        autocmd SwapExists * let v:swapchoice = 'o'
        autocmd SwapExists * echomsg ErrorMsg
        autocmd SwapExists * echo 'Duplicate edit session (readonly)'
        autocmd SwapExists * echohl None
        autocmd SwapExists * sleep 2
    augroup END

" Operating System specific settings
if has("win32") || has("win16")
    set backupdir=~/vimfiles/backup
    set dir=~/vimfiles/temp
    set undodir=~/vimfiles/undo
    "Insert date/timestamp in normal mode
    nnoremap <F5> "=strftime("%m/%d/%Y %I:%M:%S %p")<CR>PA<CR><CR>
    "Insert date/timestamp in insert mode
    inoremap <F5> <C-R>=strftime("%m/%d/%Y %I:%M:%S %p")<CR><CR><CR>
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
         " Set hotkey to launch Python code currently being edited. May need to change python executible per environment.
        nnoremap <silent> <F4> :!clear;python2.7 %<CR>
    "elseif os == \"Linux"
        " Do Linux-specific stuff.
    endif
endif

" GUI specific settings
if has("gui_running")
    " Microsoft Windows configuration (gvim)
    colorscheme herald
    "set guifont=Source_Code_Pro:h9:cANSI:b
    "set guifont=Source_Code_Pro:h10
    set guifont=DejaVu_Sans_Mono:h10
    set guioptions+=rl "set right and left side window scrollbars
    set guioptions-=T "set remove toolbar
    source $VIMRUNTIME/mswin.vim
else
    source $VIMRUNTIME/menu.vim
endif

set clipboard=unnamed
syntax on
"Note that the syntax directory is:
"*nix: .vim/syntax/ or: .vimfiles/syntax

set title
set undofile
set wrap
set autoread "Reload files changed outside vim
set bk "set backup
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf8,latin1
"↪
"β
" Display hex ID of character under cursor in statusline, requires the two lines below:
"set statusline=%F%h%r%=%n\ %y\ %b\ 0x%B\ \ %l,%c%V,%L\ %P

if has('statusline')
  set statusline=%n\                      " buffer number
  set statusline+=%#WarningMsg#                " set highlighting
  set statusline+=%F\                          " file name
  set statusline+=%#Question#                  " set highlighting
  set statusline+=%h%m%r%w\                    " help, modified, readonly, preview flags
  set statusline+=%y                           " file type
  set statusline+=%{(&fenc==\"\"?&enc:&fenc)}, " encoding
  set statusline+=%{((exists(\"+bomb\")\ &&\ &bomb)?\"B,\":\"\")} " BOM
  set statusline+=%{&fileformat},              " file format
  set statusline+=%{&spelllang}                " language of spelling checker
  set statusline+=%=                           " ident to the right
  set statusline+=%b\ 0x%-8B\                      " character code under cursor
  set statusline+=%(%l,%c%V,%L%)               " cursor position/offset
  set statusline+=\ \ %#todo#%<%P       " cursor position/offset
endif

"set statusline=%<%F%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
set laststatus=2
set visualbell
"set listchars=tab:>~,nbsp:_,trail:.
"set listchars=tab:â¸\ ,nbsp:_,trail:Â·

" so invisibles
set list
set listchars=
"set listchars=tab:
set listchars=tab:‣\ 
set listchars+=trail:·

"TOGGLES =============================================================
"Toggle relative numbering automatically on insert / command modes.
autocmd InsertEnter * :set listchars+=space:·
autocmd InsertLeave * :set listchars=space:\ 
autocmd InsertEnter * :set listchars+=eol:¬
autocmd InsertLeave * :set listchars=eol:\ 
autocmd InsertEnter * :set listchars+=tab:‣\·
autocmd InsertLeave * :set listchars=tab:‣\ 
autocmd InsertEnter * :set relativenumber
autocmd InsertLeave * :set norelativenumber

autocmd InsertEnter * :set sbr=↪\  "set showbreak
autocmd InsertLeave * :set sbr= "set showbreak

"TOGGLES =============================================================

set listchars+=extends:»
set listchars+=precedes:«
set listchars+=nbsp:.

"This section is for general vim settings
set nocompatible "This fixes the problem where arrow keys do not function properly on some systems.
set ruler
set nu "Enables line numbering

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

"https://superuser.com/questions/431233/vim-shortcut-to-move-to-beginning-of-next-line-end-of-previous-line
set whichwrap+=>,l "Wrap to next line using vim movement
set whichwrap+=<,h "Wrap to previous line using vim movement


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

" Set leader (:help <Leader>)
let mapleader = ","

" This remap is to stop insert from moving the cursor one space to the left after escaping.
inoremap <silent> <Esc> <C-O>:stopinsert<CR>
" This remap
inoremap <Leader>fn <C-R>=expand("%:p")<CR>
inoremap <Leader>rn <C-R>=expand("%")<CR>

" Find trailing whitespace characters
match ErrorMsg '\s\+$'

" Remove trailing whitespace mapping, set mark 'a' replace all trailing whitespace, return to marker 'a'. http://www.bestofvim.com/tip/trailing-whitespace/
nnoremap <Leader>rtw ma:%s/\s\+$//e<CR>`a
nnoremap <Leader>rtt ma:%s/	\+/    /e<CR>`a
nnoremap <Leader>rds :%s/\n\{3,}/\r\r/g<CR>

" firefox follow link - superceded by HandleURL function
"nnoremap <Leader>ffl Y:r!firefox "0"<CR><CR>

" Insert a text page break for notes and visual segmentation:
:ia -- ____________________________________________________________________________<CR><CR>
:ia s- ____________________________________________________________________________<CR><C-R>=strftime("%m/%d/%Y %I:%M:%S %p")<CR><CR>
:ia S- ____________________________________________________________________________<CR><C-R>=strftime("%m/%d/%Y %I:%M:%S %p")<CR><CR>
:ia x- <C-R>=strftime("%m/%d/%Y %I:%M:%S %p")<CR><CR>Updated by: Hostname/CPU/RAM/Disk Space information on ticket.
:ia z- Control ID:<CR><CR><CR>Rationale:<CR><CR><CR>Remediation:<CR><CR><CR>Steps to Reproduce:<CR>

" Open any file with a pre-existing swapfile in readonly mode:

augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists * let v:swapchoice = 'o'
    autocmd SwapExists * echomsg ErrorMsg
    autocmd SwapExists * echo 'Duplicate edit session (readonly)'
    autocmd SwapExists * echohl None
    autocmd SwapExists * sleep 2
augroup END

augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

function! HandleURL()
  let s:uri = matchstr(getline("."), 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*')
  echo s:uri
  if s:uri != ""
    silent exec "r!brave.exe \"".s:uri."\""
  else
    echo "No URI found in line."
  endif
endfunction
map <leader>gg :call HandleURL()<cr>

function! CleanURL()
  let s:uri = matchstr(getline("."), 'https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*')
  echo s:uri
  if s:uri != ""
    exec "normal o".s:uri.""
    exec "normal 0"
  else
    echo "No URI found in line."
  endif
endfunction
map <leader>cl :call CleanURL()<cr>

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

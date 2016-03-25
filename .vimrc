"""""""""""""""""""""""""""""""""""""""""""""
" LOAD PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""

" Initial settings
set nocompatible
filetype off

" Initialize Vundle
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" Define bundles via Github repos
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'fatih/vim-go'
Plugin 'janko-m/vim-test'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-commentary'
Plugin 'bling/vim-bufferline'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/gitignore'
Plugin 'IN3D/vim-raml'
Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'godlygeek/tabular'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'honza/vim-snippets'
Plugin 'elzr/vim-json'
Plugin 'flazz/vim-colorschemes'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Yggdroot/indentLine'
Plugin 'Chiel92/vim-autoformat'
Plugin 'ryanoasis/vim-devicons'
" Plugin 'nathanaelkane/vim-indent-guides'

" All plugins must be added before the following line
call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""
" SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Disable backup files
set nobackup
set nowritebackup
set noswapfile

" Sets how many lines of history VIM has to remember
set history=500

" Show the cursor position all the time
set ruler

" Display incomplete commands
set showcmd

" Always display the status line
set laststatus=2

" Automatically :write before running commands
set autowrite

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Use one space, not two, after punctuation
set nojoinspaces

" Show numbers
set number
set numberwidth=5
set relativenumber

" Show line limit
set textwidth=80
set colorcolumn=80

" Open new split panes to bottom
set splitbelow

" Open new split panes to right
set splitright

" Autocomplete with dictionary when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Set spellfile location
set spellfile=$HOME/.vim/spell-en.utf-8.add

" Auto indent
set autoindent
set si

" Wrap lines
set wrap

" Auto read when a file is changed from the outside
set autoread

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Don't redraw while executing macros (good performance config)
set lazyredraw

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Only show 15 tabs
set tabpagemax=15

" Display the current mode
set showmode

" Highlight current line
set cursorline

" No extra spaces between rows
set linespace=0

" Show matching brackets/parenthesis
set showmatch

" Search is incremental, highlighted and case insensitive
set incsearch
set hlsearch
set ignorecase
set smartcase

" Show list instead of just completing
set wildmenu

" Backspace and cursor keys wrap too
set whichwrap=b,s,h,l,<,>,[,]

" Lines to scroll when cursor leaves screen
set scrolljump=5

" Minimum lines to keep above and below cursor
set scrolloff=3

" Prevents inserting two spaces after punctuation on a join (J)
set nojoinspaces

" Background
set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" Ctags
set tags=./tags;/,~/.vim/tags

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full

" A buffer becomes hidden when it is abandoned
set hid
set hidden

" For regular expressions turn magic on
set magic

" Leader
let mapleader = " "
let g:mapleader = " "

" Enable auto indent
filetype plugin indent on

" sh syntax highlighting should default to POSIX
let g:is_posix = 1

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" :W sudo saves the file as sudo
command! W w !sudo tee % > /dev/null

" SignColumn should match background
highlight clear SignColumn

" Current line number row will have same background color in relative mode
highlight clear LineNr

" Turn persistent undo on (even when you close a buffer/VIM)
try
  set undodir=$HOME/.vim/undo
  set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""
" MAPPINGS
"""""""""""""""""""""""""""""""""""""""""""""

" Insert tab at beginning of line or use completion if not at beginning
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <leader>bb <c-^>

" Let arrow keys alone
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <leader>t :TestNearest<CR>
nnoremap <silent> <leader>T :TestFile<CR>
nnoremap <silent> <leader>a :TestSuite<CR>
nnoremap <silent> <leader>l :TestLast<CR>
nnoremap <silent> <leader>g :TestVisit<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Fast saving
nmap <leader>w :w!<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Buffers
map <leader>bn :enew<cr>
map <leader>bc :Bclose<cr>:tabclose<cr>gT
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
nmap <leader>bl :ls<CR>

" Tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext
" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
" Opens a new tab with the current buffer's path
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Fast editing and reloading of vimrc configs
map <leader>e :e! ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<CR>

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Disable search highlighting by hitting return
nnoremap <CR> :noh<CR><CR>

" NERDTree
if isdirectory(expand("~/.vim/bundle/nerdtree/"))
  map <leader>nn :NERDTreeToggle<CR>
  map <leader>nb :NERDTreeFromBookmark
  map <leader>nf :NERDTreeFind<cr>
endif

" vim-multiple-cursors
if isdirectory(expand("~/.vim/bundle/vim-multiple-cursors/"))
  let g:multi_cursor_next_key="\<C-s>"
endif

" Git Gutter
if isdirectory(expand("~/.vim/bundle/vim-gitgutter/"))
  set updatetime=250
endif

" AutoCloseTag
if isdirectory(expand("~/.vim/bundle/HTML-AutoCloseTag/"))
  nmap <Leader>ac <Plug>ToggleAutoCloseMappings
endif

" Tabularize
if isdirectory(expand("~/.vim/bundle/tabular"))
  nmap <Leader>a& :Tabularize /&<CR>
  vmap <Leader>a& :Tabularize /&<CR>
  nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
  vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
  nmap <Leader>a=> :Tabularize /=><CR>
  vmap <Leader>a=> :Tabularize /=><CR>
  nmap <Leader>a: :Tabularize /:<CR>
  vmap <Leader>a: :Tabularize /:<CR>
  nmap <Leader>a:: :Tabularize /:\zs<CR>
  vmap <Leader>a:: :Tabularize /:\zs<CR>
  nmap <Leader>a, :Tabularize /,<CR>
  vmap <Leader>a, :Tabularize /,<CR>
  nmap <Leader>a,, :Tabularize /,\zs<CR>
  vmap <Leader>a,, :Tabularize /,\zs<CR>
  nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
  vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
endif

" Session list
if isdirectory(expand("~/.vim/bundle/sessionman.vim/"))
  nmap <leader>sl :SessionList<CR>
  nmap <leader>ss :SessionSave<CR>
  nmap <leader>sc :SessionClose<CR>
endif

" TagBar
if isdirectory(expand("~/.vim/bundle/tagbar/"))
  nnoremap <silent> <leader>tt :TagbarToggle<CR>
endif

" Fugitive
if isdirectory(expand("~/.vim/bundle/vim-fugitive/"))
  nnoremap <silent> <leader>gs :Gstatus<CR>
  nnoremap <silent> <leader>gd :Gdiff<CR>
  nnoremap <silent> <leader>gc :Gcommit<CR>
  nnoremap <silent> <leader>gb :Gblame<CR>
  nnoremap <silent> <leader>gl :Glog<CR>
  nnoremap <silent> <leader>gp :Git push<CR>
  nnoremap <silent> <leader>gr :Gread<CR>
  nnoremap <silent> <leader>gw :Gwrite<CR>
  nnoremap <silent> <leader>ge :Gedit<CR>
endif

" neocomplete
if isdirectory(expand("~/.vim/bundle/neocomplete.vim/"))
  "Auto complete habit
  imap <c-j> <c-x><c-o>
  inoremap <expr> <c-k> pumvisible()?"\<Up>":"\<c-k>"
  inoremap <expr> <c-j> pumvisible()?"\<Down>":"\<c-j>"
  " Plugin key-mappings.
  inoremap <expr> <C-g> neocomplete#undo_completion()
  inoremap <expr> <C-l> neocomplete#complete_common_string()
  " Recommended key-mappings.
  " <CR>: cancel popup and insert newline.
  inoremap <silent> <CR> <C-r>=neocomplete#smart_close_popup()<CR><CR>
  " <TAB>: completion.
  inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr> <C-y> neocomplete#close_popup()
  inoremap <expr> <C-e> neocomplete#cancel_popup()
endif

" ag.vim
if isdirectory(expand("~/.vim/bundle/ag/"))
  " When you press gv you Ag after the selected text
  vnoremap <silent> gv :call VisualSelection('gv', '')<CR>
  " Open Ag and put the cursor in the right position
  map <leader>g :Ag
  " When you press <leader>r you can search and replace the selected text
  vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>
  " Do :help cope if you are unsure what cope is. It's super useful!
  " When you search with Ag, display your results in cope by doing:
  "   <leader>cc
  " To go to the next search result do:
  "   <leader>n
  " To go to the previous search results do:
  "   <leader>p
  map <leader>cc :botright cope<cr>
  map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
  map <leader>n :cn<cr>
  map <leader>p :cp<cr>
endif

" vim-autoformat
if isdirectory(expand("~/.vim/bundle/vim-autoformat/"))
  nnoremap <silent> <leader>af :Autoformat<CR>
endif

" vim-easymotion
if isdirectory(expand("~/.vim/bundle/vim-easymotion/"))
  " Gif config
  map  / <Plug>(easymotion-sn)
  omap / <Plug>(easymotion-tn)
  " These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
  " Without these mappings, `n` & `N` works fine. (These mappings just provide
  " different highlight method and have some other features )
  map  n <Plug>(easymotion-next)
  map  N <Plug>(easymotion-prev)
  " enable smart case
  let g:EasyMotion_smartcase = 1
  " Require tpope/vim-repeat to enable dot repeat support
  " Jump to anywhere with only `s{char}{target}`
  " `s<CR>` repeat last find motion.
  nmap <leader>s <Plug>(easymotion-s)
  nmap <leader>d <Plug>(easymotion-overwin-f2)
endif

"""""""""""""""""""""""""""""""""""""""""""""
" OPTIONS
"""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Automatically switch to the current file directory when a new buffer is opened
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

" Set GUI font according to system
if has("mac") || has("macunix")
  set gfn=Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
  set gfn=Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
  set gfn=Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
  set gfn=Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
  set gfn=Monospace\ 11
endif

" Open MacVim in fullscreen mode
if has("gui_macvim")
  set fuoptions=maxvert,maxhorz
  au GUIEnter * set fullscreen
endif

" Enable syntax highlighting when the terminal has colors
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Remember last buffer cursor position and custom file types
augroup vimrcEx
  autocmd!
  " Jump to the last known cursor position in a refocused file
  autocmd BufReadPost *
        \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal g`\"" |
        \ endif
  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
augroup END

" Tab completion
" Insert tab at beginning of line or use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
  set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
  set wildignore+=.git\*,.hg\*,.svn\*
endif

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS OPTIONS
"""""""""""""""""""""""""""""""""""""""""""""

" syntastic
if isdirectory(expand("~/.vim/bundle/syntastic/"))
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*

  let g:syntastic_always_populate_loc_list = 1
  let g:syntastic_auto_loc_list = 1
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0
  " enable 'rubocop' or 'mri' for ruby
  let g:syntastic_ruby_checkers = ['mri']
endif

" CTRL-P
if isdirectory(expand("~/.vim/bundle/ctrlp/"))
  " Use The Silver Searcher (https://goo.gl/uD8g6)
  if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor
    " Use ag in CtrlP for listing files (fast and respects .gitignore)
    let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'
    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
  endif
  " when invoked without an explicit starting directory,
  " CtrlP will set its local working directory according to this variable:
  let g:ctrlp_working_path_mode = 'ra'
  " maximum lines on search pane
  let g:ctrlp_max_height = 20
  " ignore files based on pattern
  let g:ctrlp_custom_ignore = { 'dir':  '\v[\/]\.(git|hg|svn)$',
        \ 'file': '\v\.(exe|so|dll)$',
        \ 'link': 'some_bad_symbolic_links' }
  " ignore files on .gitignore
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
endif

" NERDTree
if isdirectory(expand("~/.vim/bundle/nerdtree/"))
  " open a NERDTree automatically when vim starts
  " autocmd vimenter * NERDTree
  " let g:nerdtree_tabs_open_on_gui_startup=0
  " if set to 1 show bookmarks
  let NERDTreeShowBookmarks=0
  " ignored files pattern
  let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
  " ignore .gitignore custom filter:
  " ~/.vim/bundle/nerdtree/nerdtree_plugin/gitignore_filter.vim
  " if it is set to 0 then the CWD is never changed by the NERD tree."
  let NERDTreeChDirMode=0
  let g:NERDTreeChDirMode=0
  " hide tree when file is opened
  let NERDTreeQuitOnOpen=1
  " show hidden
  let NERDTreeShowHidden=1
  " maintain tree in newly opened tab
  let NERDTreeKeepTreeInNewTab=1
  " tree pane size
  let g:NERDTreeWinSize=35
  " close vim if the only window left open is a NERDTree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
endif

" vim-airline
if isdirectory(expand("~/.vim/bundle/vim-airline/"))
  let g:airline#extensions#bufferline#enabled = 1
  " enable/disable fugitive/lawrencium
  let g:airline#extensions#branch#enabled = 1
  " enable/disable syntastic integration
  let g:airline#extensions#syntastic#enabled = 1
  " enable/disable tagbar integration
  let g:airline#extensions#tagbar#enabled = 1
  " Enable the list of tabs
  let g:airline#extensions#tabline#enabled = 1
  " Show just the filename
  let g:airline#extensions#tabline#fnamemod = ':t'
  " enable/disable tmuxline integration
  let g:airline#extensions#tmuxline#enabled = 1
  " configure whether to show the previous and next modes (mru, buffer, etc...)
  let g:airline#extensions#ctrlp#show_adjacent_modes = 1
  " Enable powerline fonts
  let g:airline_powerline_fonts=1
  " Always show the status line
  set laststatus=2
  " Format the status line
  set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

  " See `:echo g:airline_theme_map` for some more choices
  if isdirectory(expand("~/.vim/bundle/vim-airline-themes/"))
    if !exists('g:airline_theme')
      let g:airline_theme = 'solarized'
    endif
    if !exists('g:airline_powerline_fonts')
      " Use the default set of separators with a few customizations
      " let g:airline_left_sep='›'  " Slightly fancier than '>'
      " let g:airline_right_sep='‹' " Slightly fancier than '<'
    endif
  endif
endif

" vim-bufferline
if isdirectory(expand("~/.vim/bundle/vim-bufferline/"))
  let g:bufferline_active_buffer_left = "["
  let g:bufferline_active_buffer_right = "]"
  let g:bufferline_modified = "+"
endif

" vim-colors-solarized
if isdirectory(expand("~/.vim/bundle/vim-colors-solarized/"))
  " let g:solarized_termcolors=256
  let g:solarized_termtrans=1
  let g:solarized_contrast="normal"
  let g:solarized_visibility="normal"
  colorscheme solarized
endif

" molokai
if isdirectory(expand("~/.vim/bundle/molokai/"))
  " If you prefer the scheme to match the original monokai background color
  let g:molokai_original = 1
  " 256 color version
  let g:rehash256 = 1
  "colorscheme molokai
endif

" Git Gutter
if isdirectory(expand("~/.vim/bundle/vim-gitgutter/"))
  set updatetime=250
  nnoremap <silent> <leader>gg :GitGutterToggle<cr>
endif

" AutoCloseTag
if isdirectory(expand("~/.vim/bundle/HTML-AutoCloseTag/"))
  " Make it so AutoCloseTag works for xml and xhtml files as well
  au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
endif

" vim-json
if isdirectory(expand("~/.vim/bundle/vim-json/"))
  " Do not hide quotes on json files
  let g:vim_json_syntax_conceal = 1
endif

" neocomplete
if isdirectory(expand("~/.vim/bundle/neocomplete.vim/"))
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_auto_select = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#auto_completion_start_length = 3
  " increase limit for tag cache files
  let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB
  " always use completions from all buffers
  if !exists('g:neocomplete#same_filetypes')
    let g:neocomplete#same_filetypes = {}
  endif
  let g:neocomplete#same_filetypes._ = '_'
  " enable omni-completion for Ruby and PHP
  call neocomplete#util#set_default_dictionary(
        \'g:neocomplete#sources#omni#input_patterns', 'ruby',
        \'[^. *\t]\.\h\w*\|\h\w*::\w*')
  call neocomplete#util#set_default_dictionary(
        \'g:neocomplete#sources#omni#input_patterns',
        \'php',
        \'[^. \t]->\h\w*\|\h\w*::\w*')
  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::\w*'
  let g:neocomplete#force_omni_input_patterns.php = '[^. \t]->\h\w*\|\h\w*::\w*'
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
endif

" Snippets
if isdirectory(expand("~/.vim/bundle/vim-snippets/"))
  " Enable neosnippet snipmate compatibility mode
  let g:neosnippet#enable_snipmate_compatibility = 1
  " Use honza's snippets.
  let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
  " Disable runtime snippets since we use honza's ones
  let g:neosnippet#disable_runtime_snippets = { '_' : 1,}
  " Disable the neosnippet preview candidate window
  " When enabled, there can be too much visual noise
  " especially when splits are used.
  " set completeopt-=preview
endif

" Indent guides
if isdirectory(expand("~/.vim/bundle/vim-indent-guides/"))
  let g:indent_guides_start_level = 2
  let g:indent_guides_guide_size = 1
  let g:indent_guides_enable_on_vim_startup = 0
endif

" indent lines
if isdirectory(expand("~/.vim/bundle/indentLine/"))
  let g:indentLine_enabled = 1
  let g:indentLine_char = "."
  let g:indentLine_color_term = 237
  " conceal workaround: https://github.com/Yggdroot/indentLine/issues/59
  set conceallevel=1
  let g:indentLine_conceallevel=1
endif

" ag.vim
if isdirectory(expand("~/.vim/bundle/ag/"))
  " start searching from your project root instead of the cwd
  let g:ag_working_path_mode="r"
endif

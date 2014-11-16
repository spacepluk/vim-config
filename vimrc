" Global vim settings

" NeoBundle {{{
if has('vim_starting')
  set nocompatible
  filetype off

  set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Navigation
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'dhruvasagar/vim-vinegar'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'vim-scripts/mru.vim'

" Whitespace
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'godlygeek/tabular'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'spacepluk/vim-bad-whitespace'
NeoBundle 'vim-scripts/IndentAnything'

" General Coding aids
NeoBundle 'honza/vim-snippets'
NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/SyntaxComplete'
NeoBundle 'vim-scripts/The-NERD-Commenter'

" VCS
NeoBundle 'mattn/gist-vim'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'mmozuras/vim-github-comment'
NeoBundle 'phleet/vim-mercenary'
NeoBundle 'tpope/vim-fugitive'

" C/C++
NeoBundle 'bjoernricks/vim-cmake'
NeoBundle 'derekwyatt/vim-fswitch'
NeoBundle 'derekwyatt/vim-protodef'
NeoBundle 'osyo-manga/vim-marching'
NeoBundle 'osyo-manga/vim-reunions'
NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
NeoBundle 'vim-scripts/DoxygenToolkit.vim'

" HTML/Javascript
NeoBundle 'bigfish/vim-js-context-coloring', {
      \   'build' : {
      \     'unix' : 'npm install',
      \     'mac' : 'npm install',
      \     'windows' : 'npm install',
      \   }
      \ }
NeoBundle 'gregsexton/MatchTag'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'marijnh/tern_for_vim', {
      \   'build' : {
      \     'unix' : 'npm install',
      \     'mac' : 'npm install',
      \     'windows' : 'npm install',
      \   }
      \ }
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mintplant/vim-literate-coffeescript'
NeoBundle 'moll/vim-node'
NeoBundle 'othree/html5.vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'vim-scripts/JavaScript-Indent'

" Other languages
NeoBundle 'artoj/qmake-syntax-vim'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'elzr/vim-json'
NeoBundle 'gkz/vim-ls'
NeoBundle 'groenewege/vim-less'
NeoBundle 'jinfield/vim-nginx'
NeoBundle 'juvenn/mustache.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'leafo/moonscript-vim'
NeoBundle 'peterhoeg/vim-qml'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'qrps/lilypond-vim'
NeoBundle 'tclem/vim-arduino'
NeoBundle 'vim-scripts/Arduino-syntax-file'
NeoBundle 'vim-scripts/glsl.vim'
NeoBundle 'wavded/vim-stylus'

" Misc
NeoBundle 'embear/vim-localvimrc'
NeoBundle 'freitass/todo.txt-vim'
NeoBundle 'jceb/vim-orgmode'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'mattn/calendar-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'Soares/butane.vim'
NeoBundle 'spacepluk/vim-airline'
NeoBundle 'spacepluk/vim-eighties'
NeoBundle 'tommcdo/vim-exchange.git'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-speeddating'
NeoBundle 'vim-scripts/ikiwiki-nav'
NeoBundle 'vim-scripts/ikiwiki-syntax'
NeoBundle 'vim-scripts/utl.vim'

" Colorschemes
NeoBundle 'CSApprox'
NeoBundle 'endel/vim-github-colorscheme'
NeoBundle 'spacepluk/vim-xoria256'
NeoBundle 'tomasr/molokai'

call neobundle#end()
filetype plugin indent on

NeoBundleCheck
" }}}


syntax on
syntax conceal on
set modelines=4
set history=1000
set number
set hidden
set lazyredraw
set showmode
set mouse=a
set title
"set t_ts=k
set foldmethod=syntax
set scrolloff=6
set visualbell

set hlsearch
set incsearch
set smartcase

set wildmenu
set wildmode=list:longest,list:full
set wildignore+=*.o,*/.hg,*/.git,*/build/*,*/node_modules,tags
set completeopt=menu,menuone,preview

set shiftwidth=2
set tabstop=2
set expandtab
set smartindent

set undofile
set undodir=~/.vim/undo
set undoreload=1000

set noswapfile

let mapleader=","
let g:html_use_css=1


" Look&Feel
set guifont=Ubuntu\ Mono\ 12
set guioptions=eAa
set t_Co=256
let g:CSApprox_use_showrgb = 1

color xoria256


" Misc mappings/tweaks {{{

" Always move within wrapped lines
noremap j gj
noremap k gk

" Change buffers
nnoremap <C-p> :bprev<CR>
nnoremap <C-n> :bnext<CR>

" make
nnoremap <silent> ,mm :Make<CR>

" Clean quickfix
nnoremap <leader>cq :call setqflist([])<CR>:redraw!<CR>

" vimdiff options
set diffopt+=vertical
nmap <silent> ,du :diffupdate<CR>

" JSON prettyfier/processor
nnoremap <leader>jq :!jq '.'

" Email flowed text {{{
" function stolen from: http://vim.wikia.com/wiki/Correct_format-flowed_email_function
function! Fixflowed()
  let pos = getpos(".")
  silent! %s/\([^]> :]\)\ze\n>[> ]*[^> ]/\1 /g
  silent! %s/ \+\ze\n[> ]*$//
  silent! %s/ \{2,}$/ /
  silent! %s/^[> ]*>\ze[^> ]/& /
  while search('^>\+ >', 'w') > 0
    s/^>\+\zs >/>/
  endwhile
  call setpos('.',pos)
endfunction

autocmd Filetype mail command! Fixq call Fixflowed()
autocmd Filetype mail set fo+=aw

nnoremap <leader>ff :Fixq<CR>
" }}}

" ctags {{{
" add current directory's generated tags file to available tags
autocmd FileType cpp set tags+=~/.vim/tags/std
autocmd FileType cpp set tags+=~/.vim/tags/qt4
nnoremap <silent> ,tt :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
nnoremap <silent> ,gt :!./gentags.sh<CR><CR>
" }}}

" }}}



""" Plugins

" airline {{{
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''

if g:airline_powerline_fonts
  set encoding=utf-8
  let g:airline_left_sep = '⮀'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_sep = '⮂'
  let g:airline_right_alt_sep = '⮃'

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'
  let g:airline_symbols.linenr = '⭡'
endif
" }}}

" indent-guides {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
noremap <silent> <Leader>ig :IndentGuidesToggle<CR>
" }}}

" neocomplete {{{
let g:neocomplete#enable_at_startup = 1
" }}}

" bad-whitespace {{{
let g:bad_whitespace_show_tabs = 1
nnoremap <leader>ws :ToggleBadWhitespace<CR>
nnoremap <leader>wd :EraseBadWhitespace<CR>
" }}}

" tagbar {{{
nnoremap <silent> ,tl :TagbarToggle<CR>
let g:tagbar_sort = 0

" coffeescript support
if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '--include-vars',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif
" }}}

" ctrlp {{{
let g:ctrlp_map = '<leader>f'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_mruf_relative = 1
let g:ctrlp_prompt_mappings = {
      \ 'PrtSelectMove("j")':   ['<c-n>', '<down>'],
      \ 'PrtSelectMove("k")':   ['<c-p>', '<up>'],
      \ 'PrtHistory(-1)':       ['<c-j>'],
      \ 'PrtHistory(1)':        ['<c-k>'],
      \ }
let g:ctrlp_user_command = {
      \ 'types': {
      \   1: ['.git', 'cd %s && git ls-files'],
      \   2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \   'fallback': 'find %s -type f'
    \ }

nnoremap <space> :CtrlPMixed<CR>
" }}}

" protodef {{{
let g:protodefprotogetter='~/.vim/bundle/vim-protodef/pullproto.pl'
" }}}

" fswitch {{{
nmap <silent> ,of :FSHere<CR>
nmap <silent> ,ol :FSRight<CR>
nmap <silent> ,oL :FSSplitRight<CR>
nmap <silent> ,oh :FSLeft<CR>
nmap <silent> ,oH :FSSplitLeft<CR>
nmap <silent> ,ok :FSAbove<CR>
nmap <silent> ,oK :FSSplitAbove<CR>
nmap <silent> ,oj :FSBelow<CR>
nmap <silent> ,oJ :FSSplitBelow<CR>
" }}}

" doxygen {{{
nnoremap <silent> ,dd :Dox<CR>
" }}}

" Rainbow Parentheses {{{
nnoremap <leader>rp :RainbowParenthesesToggle<CR>
" }}}

" gundo {{{
nnoremap <leader>gu :GundoToggle<CR>
" }}}

" UltiSnips {{{
let g:snips_author = 'Oscar Morante <oscar@morante.eu>'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsEditSplit="vertical"
" }}}

" slime {{{
let g:slime_target = "tmux"
" }}}

" syntastic {{{
let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }
" }}}

" butane {{{
noremap <leader>bd :Bclose<CR>      " Close the buffer.
noremap <leader>bt :b#<CR>          " Toggle to most recently used buffer.
noremap <leader>bx :Bclose!<CR>     " Close the buffer & discard changes.
" }}}

" ag {{{
nmap <leader>ag :Ag
" }}}

" javascript {{{
let javascript_enable_domhtmlcss = 1
" }}}

" json {{{
let g:vim_json_syntax_conceal = 0
" }}}

" gist {{{
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'iceweasel %URL% &'
let g:gist_show_privates = 1
"let g:gist_post_private = 1
"let g:gist_get_multiplefile = 1
"let g:gist_api_url = 'http://your-github-enterprise-domain/api/v3'
" }}}

" tern {{{
let g:tern_map_keys = 1
let g:tern_show_argument_hints = 'on_hold'
" }}}

" glsl {{{
au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl,*.vsh,*.fsh setf glsl
" }}}

" arduino {{{
au BufRead,BufNewFile *.pde,*.ino setf arduino
" }}}

" NERDTree {{{
let g:NERDChristmasTree = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeCasadeOpenSingleChildDir = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeHijackNetrw = 1
let g:NERDTreeMapJumpNextSibling = 0
let g:NERDTreeMapJumpPrevSibling = 0
let g:NERDTreeMinimalUI = 1
" }}}

" vim-github-comment {{{ "
let g:github_user = 'spacepluk'
let g:github_comment_open_browser = 1
" }}} vim-github-comment "

" vim-js-context-coloring {{{ "
let g:js_context_colors_enabled = 0
nnoremap <leader>jc :JSContextColorToggle<CR>
" }}} vim-js-context-coloring "

" vim-signify {{{
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_sign_change = '~'

highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
" }}}

" eighties {{{
nnoremap <leader>ee :ToggleEighties<CR>
" }}}

" SyntaxComplete {{{
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
        \ if &omnifunc == "" |
        \   setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
endif
" }}}

" localvimrc {{{
let g:localvimrc_sandbox = 0
let g:localvimrc_ask = 0
" }}}

" emmet {{{
let g:user_emmet_install_global = 0
autocmd FileType html,css,less EmmetInstall
" }}}

""" Per-language tweaks

" C/C++ {{{
au FileType c setlocal shiftwidth=4  tabstop=4 expandtab
au FileType cpp setlocal shiftwidth=4  tabstop=4 expandtab
" }}}

" XML code formatting using xmllint {{{
au FileType xml setlocal shiftwidth=4  tabstop=4 expandtab
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
" }}}

" QML {{{
au FileType qml set foldmethod=indent
" }}}

" mail {{{
au FileType mail NeoCompleteDisable
" }}}

" vim:fdm=marker

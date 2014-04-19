" Global vim settings {{{

" Vundle {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

Plugin 'airblade/vim-gitgutter'
Plugin 'bjoernricks/vim-cmake'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'
Plugin 'digitaltoad/vim-jade'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'freitass/todo.txt-vim'
Plugin 'gkz/vim-ls'
Plugin 'godlygeek/tabular'
Plugin 'gregsexton/MatchTag'
Plugin 'groenewege/vim-less'
Plugin 'jceb/vim-orgmode'
Plugin 'jinfield/vim-nginx'
Plugin 'jpalardy/vim-slime'
Plugin 'juvenn/mustache.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'leafo/moonscript-vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'LStinson/TagmaBufMgr'
Plugin 'majutsushi/tagbar'
Plugin 'marijnh/tern_for_vim'
Plugin 'mattn/calendar-vim'
Plugin 'mattn/emmet-vim'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mintplant/vim-literate-coffeescript'
Plugin 'moll/vim-node'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'peterhoeg/vim-qml'
Plugin 'phleet/vim-mercenary'
Plugin 'plasticboy/vim-markdown'
Plugin 'qrps/lilypond-vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sjl/gundo.vim'
Plugin 'Soares/butane.vim'
Plugin 'tclem/vim-arduino'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/Arduino-syntax-file'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/glsl.vim'
Plugin 'vim-scripts/ikiwiki-nav'
Plugin 'vim-scripts/ikiwiki-syntax'
Plugin 'vim-scripts/IndentAnything'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/mru.vim'
Plugin 'vim-scripts/SyntaxComplete'
Plugin 'vim-scripts/The-NERD-Commenter'
Plugin 'vim-scripts/utl.vim'
Plugin 'wavded/vim-stylus'

Plugin 'spacepluk/vim-powerline'
Plugin 'spacepluk/vim-xoria256'

filetype plugin indent on
" }}}

syntax on
set modelines=4
set history=1000
set number
set hidden
set lazyredraw
set showmode
set mouse=a
set title
set foldmethod=syntax
set scrolloff=6
set shortmess=atI
set visualbell

set hlsearch
set incsearch
set smartcase

set wildmenu
set wildignore+=*.o,*/.hg,*/.git,*/build/*,*/node_modules,tags
set wildmode=list:longest
set completeopt=menu,menuone,preview

set shiftwidth=4
set tabstop=4
set expandtab
set smartindent

set backupdir=~/.vimtmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vimtmp,~/.tmp,~/tmp,/var/tmp,/tmp

let mapleader=","
let g:html_use_css=1
" }}}

" Look&Feel {{{
set guifont=Ubuntu\ Mono\ 12
set guioptions=eAa
set t_Co=256
color xoria256
" }}}

" Navigation mappings {{{
" Change buffers
nnoremap <C-p> :bprev<CR>
nnoremap <C-n> :bnext<CR>

" Change windows (replaced w/ vim-tmux-navigator)
"nnoremap <C-h> <C-W>h
"nnoremap <C-j> <C-W>j
"nnoremap <C-k> <C-W>k
"nnoremap <C-l> <C-W>l

" File explorer
nnoremap <leader>ww :NERDTreeFind<CR>
nnoremap <leader>ee :NERDTreeToggle<CR>
" }}}



""" Misc tweaks & mappings

" highlight whitespace {{{
autocmd Syntax * syn match ExtraWhitespace /\s\+$\|\t\+/ containedin=ALL
nnoremap <leader>ws :highlight ExtraWhitespace ctermbg=red guibg=red<CR>
nnoremap <leader>wo :highlight ExtraWhitespace NONE<CR>
" }}}

" syntaxcomplete {{{
if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
        \   if &omnifunc == "" |
        \       setlocal omnifunc=syntaxcomplete#Complete |
        \   endif
endif
" }}}

" make {{{
nnoremap <silent> ,mm :make<CR><CR>
nnoremap <silent> ,mf :make<CR><CR>:cn<CR>
" }}}

" Clean quickfix {{{
nnoremap <leader>cq :call setqflist([])<CR>:redraw!<CR>
" }}}

" vimdiff mappings -- git mergetool buffer numbers {{{
nmap <silent> ,du :diffupdate<CR>
nmap <silent> ,12 :b2<CR>:diffget 1<CR>:diffupdate<CR>
nmap <silent> ,32 :b2<CR>:diffget 1<CR>:diffupdate<CR>
" }}}

" JSON prettyfier/processor {{{
nnoremap <leader>jq :!jq '.'
" }}}

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
" }}}



""" Plugins

" powerline {{{
let g:Powerline_symbols = 'fancy'
" }}}
"
" indent-guides {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=236
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
noremap <silent> <Leader>ig :IndentGuidesToggle<CR>
" }}}

" YouCompleteMe {{{
let g:ycm_key_list_select_completion = ['<Enter>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" }}}

" ctags {{{
" add current directory's generated tags file to available tags
autocmd FileType cpp set tags+=~/.vim/tags/std
autocmd FileType cpp set tags+=~/.vim/tags/qt4
nnoremap <silent> ,tt :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
nnoremap <silent> ,gt :!./gentags.sh<CR><CR>
" }}}

" tagbar {{{
nnoremap <silent> ,tl :TagbarToggle<CR>

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

" eclim {{{
let g:EclimMakeLCD='no'
let g:EclimJavaSearchSingleResult='edit'
nnoremap <leader>jj :JavaSearchContext<CR>
nnoremap <leader>jh :JavaHierarchy<CR>
nnoremap <leader>ji :JavaImportMissing<CR>
nnoremap <leader>jo :JavaImportClean<CR>
nnoremap <leader>jd :JavaDocComment<CR>
nnoremap <leader>jc :JavaCorrect<CR>
" }}}

" Rainbow Parentheses {{{
nnoremap <leader>rp :RainbowParenthesesToggle<CR>
" }}}

" tagmabufmgr {{{
let g:TagmaBufMgrMapChjkl = 0
let g:TagmaBufMgrLastWindow = 1
let g:TagmaBufMgrStatusLine = ' '
hi def link     TagmaBufMgrPlain        Identifier
hi def link     TagmaBufMgrActive       Type
hi def link     TagmaBufMgrChanged      Directory
hi def link     TagmaBufMgrChgAct       Statement
hi def link     TagmaBufMgrHelp         Special
hi def link     TagmaBufMgrQFoLL        Special
hi def link     TagmaBufMgrHelpText     String
hi def link     TagmaBufMgrUnloaded     Comment
" }}}

" gundo {{{
nnoremap <leader>gu :GundoToggle<CR>
" }}}

" snipmate {{{
let g:snips_author = 'Oscar Morante <oscar.morante@mirada.tv'
" }}}

" slime {{{
let g:slime_target = "tmux"
" }}}

" syntastic {{{
let g:syntastic_mode_map = { 'passive_filetypes': ['html'] }
" }}}

" butane {{{
noremap <leader>bd :Bclose<CR>      " Close the buffer.
noremap <leader>bl :ls<CR>          " List buffers.
noremap <leader>bn :bn<CR>          " Next buffer.
noremap <leader>bp :bp<CR>          " Previous buffer.
noremap <leader>bt :b#<CR>          " Toggle to most recently used buffer.
noremap <leader>bx :Bclose!<CR>     " Close the buffer & discard changes.
" }}}

" ag {{{
nmap <leader>ag :Ag 
" }}}

" javascript {{{
let javascript_enable_domhtmlcss = 1
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



""" Per-language tweaks

" Lua {{{
autocmd FileType lua setlocal shiftwidth=2  tabstop=2 expandtab
" }}}

" Javascript {{{
autocmd FileType javascript setl shiftwidth=2 tabstop=2 expandtab
" }}}

" Coffeescript {{{
autocmd FileType coffee setl shiftwidth=2 tabstop=2 expandtab
" }}}

" HTML {{{
autocmd FileType html setl shiftwidth=2 tabstop=2 expandtab
" }}}

" YAML {{{
autocmd FileType yaml setl shiftwidth=2 tabstop=2 expandtab
" }}}

" XML code formatting using xmllint {{{
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
" }}}



" vim:fdm=marker

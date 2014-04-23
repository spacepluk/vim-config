" Global vim settings {{{

" Vundle {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'gmarik/vundle'

" Navigation
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'dhruvasagar/vim-vinegar'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/mru.vim'

" Whitespace
Plugin 'editorconfig/editorconfig-vim'
Plugin 'godlygeek/tabular'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-scripts/IndentAnything'
Plugin 'spacepluk/vim-bad-whitespace'

" General Coding aids
Plugin 'honza/vim-snippets'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/syntastic'
Plugin 'SirVer/ultisnips'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/The-NERD-Commenter'

" VCS
Plugin 'mhinz/vim-signify'
Plugin 'mattn/gist-vim'
Plugin 'mmozuras/vim-github-comment'
Plugin 'phleet/vim-mercenary'
Plugin 'tpope/vim-fugitive'

" C/C++
Plugin 'bjoernricks/vim-cmake'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'derekwyatt/vim-protodef'
Plugin 'vim-scripts/DoxygenToolkit.vim'

" HTML/Javascript
Plugin 'bigfish/vim-js-context-coloring'
Plugin 'gregsexton/MatchTag'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'marijnh/tern_for_vim'
Plugin 'mattn/emmet-vim'
Plugin 'mintplant/vim-literate-coffeescript'
Plugin 'moll/vim-node'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'vim-scripts/JavaScript-Indent'

" Other languages
Plugin 'digitaltoad/vim-jade'
Plugin 'gkz/vim-ls'
Plugin 'groenewege/vim-less'
Plugin 'jinfield/vim-nginx'
Plugin 'juvenn/mustache.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafo/moonscript-vim'
Plugin 'peterhoeg/vim-qml'
Plugin 'plasticboy/vim-markdown'
Plugin 'qrps/lilypond-vim'
Plugin 'tclem/vim-arduino'
Plugin 'vim-scripts/Arduino-syntax-file'
Plugin 'vim-scripts/glsl.vim'
Plugin 'wavded/vim-stylus'
Plugin 'elzr/vim-json'

" Misc
Plugin 'freitass/todo.txt-vim'
Plugin 'jceb/vim-orgmode'
Plugin 'jpalardy/vim-slime'
Plugin 'mattn/calendar-vim'
Plugin 'mattn/webapi-vim'
Plugin 'Soares/butane.vim'
Plugin 'spacepluk/vim-airline'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-speeddating'
Plugin 'vim-scripts/ikiwiki-nav'
Plugin 'vim-scripts/ikiwiki-syntax'
Plugin 'vim-scripts/utl.vim'

" Colorschemes
Plugin 'CSApprox'
Plugin 'spacepluk/vim-xoria256'
Plugin 'tomasr/molokai'
Plugin 'endel/vim-github-colorscheme'


filetype plugin indent on
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
let g:CSApprox_use_showrgb = 1

color xoria256
" }}}

" Navigation mappings {{{
" Change buffers
nnoremap <C-p> :bprev<CR>
nnoremap <C-n> :bnext<CR>
" }}}



""" Misc tweaks & mappings

" make {{{
nnoremap <silent> ,mm :make<CR><CR>
nnoremap <silent> ,mf :make<CR><CR>:cn<CR>
" }}}

" Clean quickfix {{{
nnoremap <leader>cq :call setqflist([])<CR>:redraw!<CR>
" }}}

" vimdiff mappings -- git mergetool buffer numbers {{{
nmap <silent> ,du :diffupdate<CR>
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

" airline {{{
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
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

" YouCompleteMe {{{
let g:ycm_key_list_select_completion = ['<Enter>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
" }}}

" bad-whitespace {{{
let g:bad_whitespace_show_tabs = 1
nnoremap <leader>ws :ToggleBadWhitespace<CR>
nnoremap <leader>wd :EraseBadWhitespace<CR>
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

" NERDTree {{{
let g:NERDTreeHijackNetrw = 1
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

""" Per-language tweaks

" Vim {{{
autocmd FileType vim setlocal shiftwidth=2  tabstop=2 expandtab
" }}}

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

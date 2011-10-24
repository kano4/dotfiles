" NeoBundle
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/neobundle.vim.git/
  call neobundle#rc(expand('~/.bundle'))
endif

" Plugins
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-scripts/project.tar.gz'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'soh335/vim-ref-jquery'
NeoBundle 'soh335/vim-ref-pman'
NeoBundle 'ujihisa/ref-hoogle'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vim-scripts/matchit.zip'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-haml'
NeoBundle 'kana/vim-submode'
NeoBundle 'kana/vim-arpeggio'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'taku-o/vim-toggle'
NeoBundle 'taku-o/vim-ro-when-swapfound'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'garbas/vim-showmarks'
NeoBundle 'mattn/gist-vim'
NeoBundle 'vim-scripts/java.vim'
NeoBundle 'vim-scripts/javacomplete'
NeoBundle 'vim-scripts/clang'
NeoBundle 'Shougo/clang_complete'
NeoBundle 'mattn/calendar-vim'

filetype plugin on
filetype indent on
syntax enable
set background="black"

inoremap jj <esc>
nnoremap gc `[v`]

let mapleader = ','


" Save fold settings
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd bufread * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" Don't save options
set viewoptions-=options

" Show line number
set number
highlight LineNr ctermfg=grey guifg=#050505

" Tab
set expandtab
set smartindent
set ts=2 sw=2 sts=2

" Show Tab and end-of-line space
set list
set lcs=tab:>.,trail:_,extends:\

" Show multi-byte space
highlight WideSpace ctermbg=blue guibg=blue
function! s:HighlightSpaces()
  match WideSpace /　/
endf
call s:HighlightSpaces()

" complete brace
function CompleteBrace()
  let line = strpart(getline('.'), 0, col('.') - 1)
  if line =~ ')\=$'
    return "{\n}\<Esc>0bo"
  endif
endfunction
autocmd FileType c          :inoremap <expr> { CompleteBrace()
autocmd FileType cpp        :inoremap <expr> { CompleteBrace()
autocmd FileType java       :inoremap <expr> { CompleteBrace()
autocmd FileType javascript :inoremap <expr> { CompleteBrace()

" java.vim
let java_highlight_all = 1

" javacomplete
autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo

" smartchr
inoremap <expr> = smartchr#loop('=', ' = ', ' == ')
inoremap <expr> , smartchr#loop(',', ', ')
cnoremap <expr> / smartchr#loop('/', '~/', '//', {'ctype': ':'})
inoremap <expr> { smartchr#loop('{', '#{', '{{{')

" toggle.vim
let g:toggle_pairs = {'and':'or', 'or':'and', 'if':'elsif', 'elsif':'else', 'else':'if', 'enable':'disable', 'disable':'enable'}

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
function InsertTabWrapper()
  if pumvisible()
    return "\<c-n>"
  endif
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k\|<\|/'
    return "\<tab>"
  elseif exists('&omnifunc') && &omnifunc == ''
    return "\<c-n>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" submode.vim
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>+')
call submode#map('winsize', 'n', '', '-', '<C-w>-')

" ZenCoding
let g:user_zen_settings = {'lang': 'ja', 'indentation': ' '}
imap <C-e> <C-y>,

" quickrun
let g:quickrun_config = {}
let g:quickrun_config.tcl = {'command': 'ns'}
let g:quickrun_config.matlab = {'command': 'octave', 'exec': '%c -q %s'}
augroup QrunRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

let rspec_outputter = quickrun#outputter#buffer#new()
function! rspec_outputter.init(session)
  call call(quickrun#outputter#buffer#new().init,  [a:session],  self)
endfunction

function! rspec_outputter.finish(session)
  highlight default RSpecGreen   ctermfg = Green cterm = none
  highlight default RSpecRed     ctermfg = Red   cterm = none
  highlight default RSpecComment ctermfg = Cyan  cterm = none
  highlight default RSpecNormal  ctermfg = White cterm = none
  call matchadd("RSpecGreen", "^[\.F]*\.[\.F]*$")
  call matchadd("RSpecGreen", "^.*, 0 failures$")
  call matchadd("RSpecRed", "F")
  call matchadd("RSpecRed", "^.*, [1-9]* failures.*$")
  call matchadd("RSpecRed", "^.*, 1 failure.*$")
  call matchadd("RSpecRed", "^ *(.*$")
  call matchadd("RSpecRed", "^ *expected.*$")
  call matchadd("RSpecRed", "^ *got.*$")
  call matchadd("RSpecRed", "^ *Failure/Error:.*$")
  call matchadd("RSpecRed", "^.*(FAILED - [0-9]*)$")
  call matchadd("RSpecRed", "^rspec .*:.*$")
  call matchadd("RSpecComment", " # .*$")
  call matchadd("RSpecNormal", "^Failures:")
  call matchadd("RSpecNormal", "^Finished")
  call matchadd("RSpecNormal", "^Failed")

  call call(quickrun#outputter#buffer#new().finish, [a:session], self)
endfunction

call quickrun#register_outputter("rspec_outputter", rspec_outputter)
let g:quickrun_config['ruby.rspec'] = {
      \ 'command': 'rspec',
      \ 'outputter': 'rspec_outputter',
      \ }

" eskk.vim
if v:version > 702
  NeoBundle 'tyru/eskk.vim'
  let g:eskk#dictionary = '~/.skk-jisyo'
  let g:eskk#large_dictionary = '~/.SKK-JISYO.L'
endif

" unite.vim
let s:unite_source = {
      \ 'name': 'evalruby',
      \ 'is_volatile': 1,
      \ 'required_pattern_length': 1,
      \ 'max_candidates': 30,
      \ }

function! s:unite_source.gather_candidates(args,  context)
  if a:context.input[-1:] == '.'
    let methods = split(
          \ unite#util#system(printf('ruby -e "puts %s.methods"', a:context.input[:-2])),
          \ "\n")
    call map(methods,  printf("'%s' . v:val", a:context.input))
  else
    let methods = [a:context.input]
  endif
  return map(methods, '{
        \ "word": v:val,
        \ "source": "evalruby",
        \ "kind": "command",
        \ "action__command": printf("!ruby -e \"p %s\"",  v:val),
        \ }')
endfunction
call unite#define_source(s:unite_source)

" showmarks
let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" arpeggio.vim
call arpeggio#load()
Arpeggionnoremap km :<C-u>Unite buffer<CR>
Arpeggionnoremap lm :<C-u>Unite outline<CR>

nnoremap gk k
nnoremap gj j
nnoremap k gk
nnoremap j gj
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo' : 'l'

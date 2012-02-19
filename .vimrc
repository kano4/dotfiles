" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Plugins
Bundle 'gmarik/vundle'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'mattn/zencoding-vim'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'soh335/vim-ref-jquery'
Bundle 'soh335/vim-ref-pman'
Bundle 'ujihisa/ref-hoogle'
Bundle 'pekepeke/ref-javadoc'
Bundle 'mojako/ref-sources.vim'
Bundle 'tpope/vim-surround'
Bundle 'vim-scripts/matchit.zip'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-haml'
Bundle 'kana/vim-submode'
Bundle 'kana/vim-arpeggio'
Bundle 'Shougo/unite.vim'
Bundle 'h1mesuke/unite-outline'
Bundle 'sgur/unite-qf'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neocomplcache-snippets-complete'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'kana/vim-smartchr'
Bundle 'taku-o/vim-toggle'
Bundle 'taku-o/vim-ro-when-swapfound'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-scripts/sudo.vim'
Bundle 'mattn/gist-vim'
Bundle 'vim-scripts/java.vim'
Bundle 'vim-scripts/javacomplete'
Bundle 'vim-scripts/clang'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/errormarker.vim'
Bundle 'dannyob/quickfixstatus'
Bundle 'vim-scripts/buftabs'

filetype plugin on
filetype indent on
syntax enable

inoremap jj <esc>
nnoremap gc `[v`]

let mapleader = ','

nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>
nnoremap <C-h> :<C-u>help<Space>
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>
nnoremap <Space>b :bp<CR>
nnoremap <Space>n :bn<CR>
nnoremap <Space>bf :bf<CR>
nnoremap <Space>bl :bl<CR>
nnoremap <Space>bw :bw<CR>

nnoremap <Space>S :<C-u>sp<Enter>:<C-u>VimShell<Enter>

autocmd FileType * setlocal formatoptions-=ro
autocmd FileType html setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/

" StatusLine
highlight StatusLine   ctermfg=White    ctermbg=DarkGray cterm=bold
highlight StatusLineNC ctermfg=DarkBlue ctermbg=DarkGray cterm=none

let g:buftabs_only_basename=1
let g:buftabs_in_statusline=1
let g:buftabs_active_highlight_group="Visual"
"set statusline=%=\ %f\ [%{fugitive#statusline()}][%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%Y]\[%04l,%04v][%p%%]
set laststatus=2

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
autocmd FileType java :set noexpandtab

" Show Tab and end-of-line space
set list
set lcs=tab:>.,trail:_,extends:\

" Show multi-byte space
highlight WideSpace ctermbg=blue guibg=blue
function! s:HighlightSpaces()
  match WideSpace /　/
endf
call s:HighlightSpaces()

" vimshell
let g:vimshell_prompt = '% '

" vim-easymotion
let g:EasyMotion_leader_key = '<Leader>'

" java.vim
let java_highlight_all = 1

" javacomplete
autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo

" smartchr
cnoremap <expr> / smartchr#loop('/', '~/', '//', {'ctype': ':'})
inoremap <expr> { smartchr#loop('{', '#{', '{{{')
inoremap <expr> # smartchr#loop('#', '##', '# => ')

" toggle.vim
let g:toggle_pairs = {'and':'or', 'or':'and', 'if':'elsif', 'elsif':'else', 'else':'if', 'enable':'disable', 'disable':'enable'}

" neocomplcache
let g:neocomplcache_enable_at_startup = 1
function! InsertTabWrapper()
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

" neocomplcache snippets
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
let g:neocomplcache_snippets_dir = $HOME.'/.vim/snippets'

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
let g:user_zen_settings = {'lang': 'ja', 'indentation': '  '}
imap <C-e> <C-y>,

" quickrun
let g:quickrun_config = {}
let g:quickrun_config={'*': {'split': ''}}

" quickrun for RSpec
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

" quickrun for Test::Unit
augroup QrunTestUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile test_*.rb set filetype=ruby.testunit
augroup END

let testunit_outputter = quickrun#outputter#buffer#new()
function! testunit_outputter.init(session)
  call call(quickrun#outputter#buffer#new().init,  [a:session],  self)
endfunction

function! testunit_outputter.finish(session)
  highlight default TestUnitGreen   ctermfg = Green  cterm = none
  highlight default TestUnitYellow  ctermfg = Yellow cterm = none
  highlight default TestUnitRed     ctermfg = Red    cterm = none
  highlight default TestUnitNormal  ctermfg = White  cterm = none
  call matchadd("TestUnitGreen", "^[\.F]*\.[\.F]*$")
  call matchadd("TestUnitGreen", "^.*0 failures,.*$")
  call matchadd("TestUnitYellow", " Error:")
  call matchadd("TestUnitYellow", "E")
  call matchadd("TestUnitYellow", "^.*[1-9][0-9]* errors,.*$")
  call matchadd("TestUnitRed", "F")
  call matchadd("TestUnitRed", " Failure:")
  call matchadd("TestUnitRed", "^.*[1-9][0-9]* failures,.*$")
  call matchadd("TestUnitNormal", "NoMethodError")
  call matchadd("TestUnitNormal", "ArgumentError")
  call matchadd("TestUnitNormal", "^Finished")

  call call(quickrun#outputter#buffer#new().finish, [a:session], self)
endfunction

call quickrun#register_outputter("testunit_outputter", testunit_outputter)
let g:quickrun_config['ruby.testunit'] = {
      \ 'command': 'ruby',
      \ 'outputter': 'testunit_outputter',
      \ }

" quickrun for Cucumber
let cucumber_outputter = quickrun#outputter#buffer#new()
function! cucumber_outputter.init(session)
  call call(quickrun#outputter#buffer#new().init,  [a:session],  self)
endfunction

function! cucumber_outputter.finish(session)
  highlight default CucumberRed        ctermfg = Red     cterm = none
  highlight default CucumberYellow     ctermfg = Yellow  cterm = none
  highlight default CucumberCyan       ctermfg = Cyan    cterm = none
  highlight default CucumberGreen      ctermfg = Green   cterm = none
  call matchadd("CucumberRed",    "[1-9][0-9]* failed")
  call matchadd("CucumberYellow", "[1-9][0-9]* undefined")
  call matchadd("CucumberCyan",   "[1-9][0-9]* skipped")
  call matchadd("CucumberGreen",  "[1-9][0-9]* passed")

  call call(quickrun#outputter#buffer#new().finish, [a:session], self)
endfunction

call quickrun#register_outputter("cucumber_outputter", cucumber_outputter)
let g:quickrun_config['cucumber'] = {
      \ 'command': 'cucumber',
      \ 'outputter': 'cucumber_outputter',
      \ }

" eskk.vim
if v:version > 702
  Bundle 'tyru/eskk.vim'
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

" arpeggio.vim
call arpeggio#load()
Arpeggionnoremap fj :<C-u>Unite buffer<CR>
Arpeggionnoremap fk :<C-u>Unite outline<CR>
Arpeggionnoremap fl :<C-u>Unite qf<CR>

nnoremap gk k
nnoremap gj j
nnoremap k gk
nnoremap j gj
nnoremap <expr> h col('.') == 1 && foldlevel(line('.')) > 0 ? 'zc' : 'h'
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo' : 'l'

" vim-fugitive
nnoremap <Space>gd :<C-u>Gdiff<Enter>
nnoremap <Space>gs :<C-u>Gstatus<Enter>
nnoremap <Space>gl :!git log<Enter>
nnoremap <Space>gh :!git hist<Enter>
nnoremap <Space>ga :<C-u>Gwrite<Enter>
nnoremap <Space>gc :<C-u>Gcommit<Enter>
nnoremap <Space>gC :<C-u>Git commit --amend<Enter>
nnoremap <Space>gb :<C-u>Gblame<Enter>
highlight DiffAdd ctermfg=White

" vim-ref
let g:ref_refe_cmd = "/usr/local/bin/rubyrefm/refe-1_9_2"

" errormarker.vim
let g:errormarker_errortext = '!!'
let g:errormarker_warningtext = '??'
highlight SpellBad ctermbg=Red ctermfg=White
let g:errormarker_errorgroup = 'ErrorMsg'
let g:errormarker_warninggroup = 'Todo'
if !exists('g:flymake_enabled')
  let g:flymake_enabled = 1
  au BufWritePost *.pl silent make -c %
  au BufWritePost *.pl silent redraw!
endif
autocmd FileType perl :compiler perl

" Vundle Setting
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" My Bundles
Bundle 'ruby.vim'
Bundle 'project.tar.gz'
Bundle 'ZenCoding.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'endwise.vim'
Bundle 'surround.vim'
Bundle 'matchit.zip'
Bundle 'kchmck/vim-coffee-script'
Bundle 'cucumber.zip'
Bundle 'haml.zip'
Bundle 'submode'
Bundle 'arpeggio'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/vimshell'
Bundle 'Shougo/vimproc'
Bundle 'Shougo/vimfiler'
Bundle 'tyru/eskk.vim'
Bundle 'smartchr'
Bundle 'taku-o/vim-toggle'

Bundle 'mattn/calendar-vim'

filetype off
filetype indent on
syntax enable

inoremap jj <esc>

" Save fold settings.
autocmd BufWritePost * if expand('%') != '' && &buftype !~ 'nofile' | mkview | endif
autocmd BufRead * if expand('%') != '' && &buftype !~ 'nofile' | silent loadview | endif
" Don't save options.
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

nnoremap gc `[v`]

" smartchr
inoremap <expr> = smartchr#loop(' = ', '=', ' == ')
inoremap <expr> , smartchr#loop(', ', ',')
cnoremap <expr> / smartchr#loop('/', '~/', '//', {'ctype': ':'})

" toggle.vim
let g:toggle_pairs = {'and':'or', 'or':'and', 'if':'elsif', 'elsif':'else', 'else':'if', 'enable':'disable', 'disable':'enable'}

" Setting neocomplcache
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
  highlight default RSpecSuccess ctermfg = Green cterm = none
  highlight default RSpecFail    ctermfg = Red   cterm = none
  highlight default RSpecComment ctermfg = Cyan  cterm = none
  highlight default RSpecNormal  ctermfg = White cterm = none
  call matchadd("RSpecSuccess", "^[\.F]*\.[\.F]*$")
  call matchadd("RSpecSuccess", "^.*, 0 failures$")
  call matchadd("RSpecFail", "F")
  call matchadd("RSpecFail", "^.*, [1-9]* failures.*$")
  call matchadd("RSpecFail", "^.*, 1 failure.*$")
  call matchadd("RSpecFail", "^ *expected.*$")
  call matchadd("RSpecFail", "^ *got.*$")
  call matchadd("RSpecFail", "^ *Failure/Error:.*$")
  call matchadd("RSpecFail", "^.*(FAILED - [0-9]*)$")
  call matchadd("RSpecFail", "^rspec .*:.*$")
  call matchadd("RSpecComment", " # .*$")
  call matchadd("RSpecNormal", "^Failures:")
  call matchadd("RSpecNormal", "^Finished")
  call matchadd("RSpecNormal", "^Failed")

  call call(quickrun#outputter#buffer#new().finish,  [a:session], self)
endfunction

call quickrun#register_outputter("rspec_outputter", rspec_outputter)
let g:quickrun_config['ruby.rspec'] = {
      \ 'command': 'rspec',
      \ 'outputter': 'rspec_outputter',
      \ }

" eskk.vim
let g:eskk#dictionary = '~/.ssk-jisyo'
let g:eskk#large_dictionary = '~/.skk-jisyo/SKK-JISYO.L'

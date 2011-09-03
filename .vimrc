" Vundle Setting
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" My Bundles
Bundle 'ruby.vim'
Bundle 'rails.vim'
Bundle 'project.tar.gz'
Bundle 'ZenCoding.vim'
Bundle 'neocomplcache'
Bundle 'unite.vim'
Bundle 'thinca/vim-quickrun'
Bundle 'endwise.vim'
Bundle 'surround.vim'
Bundle 'matchit.zip'
Bundle 'kchmck/vim-coffee-script'
Bundle 'cucumber.zip'
Bundle 'haml.zip'

filetype off
filetype indent on
syntax enable
imap <C-j> <esc>

" Setting ZenCoding
let g:user_zen_settings = {'lang': 'ja', 'indentation': ' '}
imap <C-e> <C-y>,

" Setting quickrun
let g:quickrun_config = {}
let g:quickrun_config.tcl = {'command': 'ns'}
let g:quickrun_config.matlab = {'command': 'octave', 'exec': '%c -q %s'}
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'args': '-fs'}
augroup QrunRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END

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

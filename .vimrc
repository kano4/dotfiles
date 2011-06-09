" Vundle Setting
set rtp+=~/.vim/vundle.git/
call vundle#rc()

" My Bundles
Bundle 'ruby.vim'
Bundle 'rails.vim'
Bundle 'ZenCoding.vim'
Bundle 'neocomplcache'
Bundle 'quickrun.vim'
Bundle 'endwise.vim'



filetype off
filetype indent on
syntax enable

" Setting ZenCoding
let g:user_zen_settings = {'lang': 'ja', 'indentation': ' '}
imap <C-e> <C-y>,

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

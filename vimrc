" based out of
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/
" https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/

set encoding=utf-8

au BufNewFile,BufRead *.py :
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" set tabstop=4
" set softtabstop=4 |
" set shiftwidth=4 |
" set textwidth=79 |
" set expandtab |
" set autoindent |
" set fileformat=unix |


au BufNewFile,BufRead *.js,*.html,*.css :
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" flag extra whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

"I don't like swap files
set noswapfile

" we like writting always in the middle of the screen
set so=999

" Space is your LEADER key
let mapleader = "\<Space>"

" mapping most frequent actions
nnoremap <Leader>w :w<CR>

" NERDTree starting when vim starts
autocmd vimenter * NERDTree

" remove *.pyc files from nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" syntax highlight
let python_highlight_all=1
syntax on

" beautiful console theme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" swicth console theme using F5
call togglebg#map("<F5>")

" access your system clipboard
set clipboard=unnamed

" python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
      
"where split panes should occur"
set splitbelow
set splitright

"navigate between panes"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"having line numbers displayed on the left"
set nu

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Enable the docstrings after folding
let g:SimpylFold_docstring_preview=1

"Vundle Plug-in manager"
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead
" of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive'

" >> run :PluginInstall after updating the Plugins list <<

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

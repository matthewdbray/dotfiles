" Sample .vimrc file by Martin Brochhaus
" Presented at PyCon APAC 2012

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" Marking where you were before exiting the file and returning
autocmd! BufWritePre * :normal ma
autocmd! BufReadPost * :silent! :normal `a0

" Better copy & paste
" When you want to paste large blocks of code into vim, press F2 before you
" paste. At the bottom you should see ``-- INSERT (paste) --``.

set pastetoggle=<F2>
set clipboard=unnamed


" Mouse and backspace
set mouse=a  " on OSX press ALT and click
set bs=2     " make backspace behave like normal again

" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","


" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quick quit command
nnoremap <C-z> :update<CR>
inoremap <C-z> <C-O>:update<CR>
vnoremap <C-z> <C-O>:update<CR>

" bind Ctrl+<movement> keys to move around the windows, instead of using Ctrl+w + <movement>
" Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>


" map sort function to a key
vnoremap <Leader>s :sort<CR>


" easier moving of code blocks
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation


" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Color scheme
" mkdir -p ~/.vim/colors && cd ~/.vim/colors
" wget -O wombat256mod.vim http://www.vim.org/scripts/download_script.php?src_id=13400
set t_Co=256
color wombat256mod


" Enable syntax highlighting
" You need to reload this file for the change to apply
filetype off
filetype plugin indent on
syntax on


" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


" easier formatting of paragraphs
vmap Q gq
nmap Q gqap


" Useful settings
set history=700
set undolevels=700


" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
"" set nobackup
"" set nowritebackup
"" set noswapfile

" ============================================================================
" My Additions 
" ============================================================================

" Quick map to go to the end of a line and add a line and go into <insert> mode
noremap <Leader>e $<Insert><Right>

" Mapping of the python block comment function
nnoremap <Leader>bb :call PythonBlockComment()<CR>


" Imporve up/down movement on wrapped lines 
"nnoremap j gj
"nnoremap k gk 

" comment line, selection with Ctrl-N,Ctrl-N
au BufEnter *.py nnoremap  <Leader>f    mn:s/^\(\s*\)#*\(.*\)/\1#\2/ge<CR>:noh<CR>`n
au BufEnter *.py inoremap  <Leader>f   <C-O>mn<C-O>:s/^\(\s*\)#*\(.*\)/\1#\2/ge<CR><C-O>:noh<CR><C-O>`n
au BufEnter *.py vnoremap  <Leader>f   mn:s/^\(\s*\)#*\(.*\)/\1#\2/ge<CR>:noh<CR>gv`n

" uncomment line, selection with Ctrl-N,N
au BufEnter *.py nnoremap  <Leader>ff     mn:s/^\(\s*\)#\([^ ]\)/\1\2/ge<CR>:s/^#$//ge<CR>:noh<CR>`n
au BufEnter *.py inoremap  <Leader>ff     <C-O>mn<C-O>:s/^\(\s*\)#\([^ ]\)/\1\2/ge<CR><C-O>:s/^#$//ge<CR><C-O>:noh<CR><C-O>`n
au BufEnter *.py vnoremap  <Leader>ff     mn:s/^\(\s*\)#\([^ ]\)/\1\2/ge<CR>gv:s/#\n/\r/ge<CR>:noh<CR>gv`n

"function! PythonBlockComment()
"python << endpython
"import vim
"def normal(str):
    "vim.command("normal! "+str)
"normal('mp') # marking beginning 
"normal('gqap') # some function to wrap 
"normal('mq') # marking end 
"b = vim.current.buffer
"w = vim.current.window
"crow, ccol = w.cursor
"start, col = b.mark('p')
"end, col = b.mark('q')
"normal('`p')
"normal('k')
"vim.command(':pu _')
"block = '#' + '='*(76-ccol)
"normal("i" + block)
"vim.command('%d,%ds/^/# /' % (start+1, end))
"w.cursor = (end+1,0)
"normal("i" + block)
"endpython
"endfunction

function! PythonBlockComment()
python << endpython
import vim 
def normal(str):
    vim.command("normal! " + str)
w = vim.current.window
vim.command("set tw=77")
normal('0')
row, col = w.cursor
index = row - 1 
isBegLine = False
if vim.current.buffer[index][0]==" ": 
    normal("0w") 
else:
    isBegLine = True
normal('mp')
normal('O')
normal('j')
row, col = w.cursor
block = '#' + '='*(78-col)
spaces = ' '*col
normal("o")
comment_bar = "i" + spaces + block
normal(comment_bar)
normal("me")
normal("gqap")
normal("`p")
normal("O")
normal(comment_bar)
normal("j")
try:
    while vim.current.buffer[row].lstrip() != block: 
        row += 1 
        if isBegLine:
            normal("0")
        else:
            normal("0w")
        normal("i# ")
        normal("j")
except:
    print "Something is wrong"
normal("`p")
normal("2k")
normal("dd")
normal("`e")
normal("o")
vim.command("set tw=79")
endpython
endfunction
               
" Setup Pathogen to manage your plugins mkdir -p ~/.vim/autoload
" ~/.vim/bundle curl -so ~/.vim/autoload/pathogen.vim
" https://raw.githubusercontent.com/tpope/vim-pathogen/master/autoload/pathogen.vim
" Now you can install any plugin into a .vim/bundle/plugin-name/ folder
call pathogen#infect()


" ============================================================================
" Python IDE Setup
" ============================================================================


" Settings for vim-powerline
" cd ~/.vim/bundle
" git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2


" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*


" Settings for python-mode
" Note: I'm no longer using this. Leave this commented out
" and uncomment the part about jedi-vim instead
" cd ~/.vim/bundle
" git clone https://github.com/klen/python-mode
"" map <Leader>g :call RopeGotoDefinition()<CR>
"" let ropevim_enable_shortcuts = 1
"" let g:pymode_rope_goto_def_newwin = "vnew"
"" let g:pymode_rope_extended_complete = 1
"" let g:pymode_breakpoint = 0
"" let g:pymode_syntax = 1
"" let g:pymode_syntax_builtin_objs = 0
"" let g:pymode_syntax_builtin_funcs = 0
"" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>


" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable


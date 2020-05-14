" Allows incsearch highlighting for range commands.
cnoremap ~~c <CR>:t''<CR>
cnoremap ~~m <CR>:m''<CR>
cnoremap ~~d <CR>:d<CR>``

" Change colors (mnemonic: change your colors {light|dark}).
nnoremap cycl :colorscheme Tomorrow<CR>
nnoremap cycd :colorscheme xoria256<CR>

" Reformat paragraph.
nnoremap <Leader>rp vipJVgq

" Toggle paste mode.
nnoremap <Leader>, :set paste!<CR>

" Easily edit the alternate file without having to reach up and hit Ctrl-6.
" Because my <Leader> is set to comma, I just hit `,,` to run this.
nnoremap <Leader>. :e #<CR>

" Toggle search highlighting.
nnoremap <Space> :set hlsearch!<CR>

" Display a list of all search matches. This mapping cleverly uses the :g
" command to find lines matching the last-used search pattern and implicitly
" runs its default command "p", which prints matches.
nnoremap g/ :g//<CR>

" Y yanks to the end of the line, as you would expect it to.
nnoremap Y y$

" Leader-s toggles syntastic, which displays errors for 'interpretable' files.
nnoremap <Leader>s :SyntasticToggleMode<CR>

" Delete trailing whitespace.
nnoremap <Leader>S :call StripTrailingWhitespace()<CR>

" Create surrounding HTML tags out of the word near the cursor.
inoremap <C-a> <Esc>viwc<"></"><Esc>cit

" Set Shift-Left and Shift-Right to scroll left and right. Helpful while using
" the diff function.
nnoremap <S-Left> 5zh
nnoremap <S-Right> 5zl

" Map the movement command that cycles through diff changes to also center the
" line vertically in the window when it is arrived at. It's convenient.
nnoremap ]c ]cz.
nnoremap [c [cz.

" Indent or 'outdent' the last 'put' block with shift-tab (outdent) and tab
" (indent). This way you can put a block and immediately move it to the
" correct indention. This is probably my favorite mapping.
nnoremap <S-Tab> '[<lt>']
nnoremap <Tab> '[>']

nnoremap [j <C-o>
nnoremap ]j <C-i>

" Ctrl-E while in insert mode moves the cursor to the end of the line, a la
" OS X and other UN*X interfaces (e.g. bash).
inoremap <C-e> <Esc>A

" Mappings for easier split window navigation:
" Ctrl-w followed by u and d for up and down moves you to the next window
" either up or down and maximizes it all at once (accordion mode).
nnoremap <C-w>u <C-w><Up><C-w>_
nnoremap <C-w>d <C-w><Down><C-w>_

" ----------------------------- Omnicompletion --------------------------------
" Remap the omnicompletion commands because all the <C-x> shit is annoying.

" Words
"inoremap <Leader><Tab> <C-x><C-o>

" Filenames
inoremap <Leader>: <C-x><C-f>

" Lines
inoremap <Leader>= <C-x><C-l>

" --------------------------------- Ctrl-P ------------------------------------
nnoremap <C-p> :CtrlP<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>f :CtrlPFunky<CR>

" --------------------------- Visual Mode Mappings ----------------------------
" In visual mode, D will Duplicate the selected lines after the visual block.
vnoremap D y'>p']

" Allow * and # to work the way you would expect when some text is selected.
" These use the z register for now until I can find the more elegant solution,
" which I know exists.
vnoremap * "zy/\V<C-r>z<CR>
vnoremap # "zy?\V<C-r>z<CR>

" Let ,a start an easy align command for me.
vnoremap <Leader>a :EasyAlign<CR>

" --------------------------------- Tagbar ------------------------------------
nmap <F8> :TagbarToggle<CR>

" --------------------------------- Others ------------------------------------
 noremap  <Up> ""
 noremap! <Up> <Esc>
 noremap  <Down> ""
 noremap! <Down> <Esc>
 noremap  <Left> ""
 noremap! <Left> <Esc>
 noremap  <Right> ""
 noremap! <Right> <Esc>
 
" vim: set et ts=4 sw=4 :

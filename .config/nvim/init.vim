syntax on

set noshowmatch
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set backup
set backupdir=~/.vim/backup
set writebackup
set backupcopy=yes
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set cmdheight=1
set updatetime=200
set shortmess+=c
set colorcolumn=80
set nopaste
set autochdir
set noshowmode
set sessionoptions+=tabpages,globals
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set clipboard+=unnamedplus

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'rendon/vim-rooter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'szw/vim-maximizer'
Plug 'muellan/vim-toggle-ui-elements'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'

call plug#end()

let g:clipboard = {
      \   'name': 'win32yank-wsl',
      \   'copy': {
      \      '+': ['win32yank.exe', '-i', '--crlf'],
      \      '*': ['win32yank.exe', '-i', '--crlf'],
      \    },
      \   'paste': {
      \      '+': ['win32yank.exe', '-o', '--lf'],
      \      '*': ['win32yank.exe', '-o', '--lf'],
      \   },
      \   'cache_enabled': 0,
      \ }

let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx'
let g:indentLine_setColors = 0
let g:indentLine_faster = 1
let g:indentLine_setColors = 1
let g:airline_section_x=''
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 0
let g:airline_theme = 'gruvbox_material'
let airline#extensions#tabline#tabs_label = ''
let airline#extensions#tabline#show_splits = 0

let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_background = 'medium'

" Fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gs :G<CR>

" Whitespace
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Functions
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
autocmd BufWritePre * :call TrimWhitespace()
autocmd BufWritePre * let &bex = '@' . strftime("%F.%H:%M")
autocmd CursorHold * silent call CocActionAsync('highlight')
let loaded_matchparen = 1
let mapleader = " "
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
lua require'colorizer'.setup()
fun! GotoWindow(id)
    call win_gotoid(a:id)
    MaximizerToggle
endfun
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport')

colorscheme gruvbox-material
set background=dark

" Keys
nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :close<CR>
nmap <leader>ss :split<Return><C-w>w
nmap <leader>sv :vsplit<Return><C-w>w
inoremap <C-c> <esc>
inoremap jj <ESC>
nnoremap <leader>pv :NERDTreeToggle<CR>
nnoremap <C-p> :Files<CR>
map <Leader>pf :Files src/<CR>
map <Leader>of :GFiles<CR>
nnoremap <leader>pcc :e ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
tnoremap <silent> <C-[><C-[> <C-\><C-n>
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 :b#<CR>
nmap <leader>sh :StatusBarToggle<CR>
nmap <leader>y <Plug>yankstack_substitute_older_paste
nmap <leader>Y <Plug>yankstack_substitute_newer_paste
nnoremap <leader>m :MaximizerToggle!<CR>

nmap <leader>gh :call <SID>show_documentation()<CR>
xmap <leader>gsa  <Plug>(coc-codeaction-selected)
nmap <leader>gsa  <Plug>(coc-codeaction-selected)
nmap <leader>ga  <Plug>(coc-codeaction)
xmap <leader>gcs <Plug>(coc-convert-snippet)
nmap <leader>gor :CocCommand tsserver.organizeImports<Return><CR>
nmap <silent> <leader>gn <Plug>(coc-diagnostic-previous)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
xmap <leader>gf  <Plug>(coc-format-selected)
nmap <leader>gf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-fix-current)
nmap <silent> <leader>rs <Plug>(coc-range-select)
xmap <silent> <leader>rs <Plug>(coc-range-select)
nmap <leader>rr <Plug>(coc-rename)
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

nmap <leader>t; :call GotoBuffer(0)<CR>
nmap <leader>t' :call GotoBuffer(1)<CR>
nmap <leader>t. :call GotoBuffer(2)<CR>
nmap <leader>t/ :call GotoBuffer(3)<CR>

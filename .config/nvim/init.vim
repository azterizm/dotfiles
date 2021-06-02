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
set signcolumn=no
set ttyfast

set statusline=
set statusline+=%#DiffAdd#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#DiffChange#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#DiffDelete#%{(mode()=='r')?'\ \ RPLACE\ ':''}
set statusline+=%#Cursor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=\ %n\           " buffer number
set statusline+=%#Visual#       " colour
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}
set statusline+=%#CursorIM#     " colour
set statusline+=%R                        " readonly flag
set statusline+=%M                        " modified [+] flag
set statusline+=%#Cursor#               " colour
set statusline+=%#CursorLine#     " colour
set statusline+=\ %t\                   " short file name
set statusline+=%=                          " right align
set statusline+=%#CursorLine#   " colour
set statusline+=\ %Y\                   " file type
set statusline+=%#CursorIM#     " colour
set statusline+=\ %3l:%-2c\         " line + column
set statusline+=%#Cursor#       " colour
set statusline+=\ %3p%%\                " percentage

highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'rendon/vim-rooter'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'szw/vim-maximizer'
Plug 'muellan/vim-toggle-ui-elements'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf.vim'
Plug 'alvan/vim-closetag'

Plug 'sainnhe/gruvbox-material'

call plug#end()

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.jsx,*.ts,*.tsx'
let g:indentLine_setColors = 0
let g:indentLine_faster = 1
let g:indentLine_setColors = 1

let g:gruvbox_material_enable_italic = 0
let g:gruvbox_material_disable_italic_comment = 1
let g:gruvbox_material_background = 'soft'

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
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
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

nmap <leader>cs <cmd>bw! term<CR>
nmap <leader>t' <cmd>term powershell.exe 'yarn dev:server:clean'<CR>
nmap <leader>t" <cmd>term powershell.exe 'yarn serve:clean'<CR>

nnoremap <leader>pw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>phw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>q :close<CR>
nmap <leader>ss :split<Return><C-w>w
nmap <leader>sv :vsplit<Return><C-w>w
nnoremap <leader>pv <cmd>CocCommand explorer<CR>
nnoremap <leader>pf <cmd>Files src<CR>
nnoremap <leader>pg <cmd>GFiles<CR>
nnoremap <leader>ps <cmd>Files<CR>
nnoremap <leader>pb <cmd>Buffers<CR>
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
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
inoremap <C-c> <esc>
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


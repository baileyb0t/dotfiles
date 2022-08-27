<<<<<<< HEAD
" ---- LAYOUT {{{

" enable file detection
filetype on

" enable plugins for filetype
filetype plugin on

" enable filetype indent rule
filetype indent on

" Turn on syntax highlighting
syntax on

" set line numbers relative to cursor line
set relativenumber number

" Highlight horizontal boundary (using Black's recommended)
set colorcolumn=88

" Highlight cursor row
set cursorline

" Highlight cursor column
set cursorcolumn

<<<<<<<< HEAD:nvim/prev_init.vim
" Set shift width to 4 spaces.
set shiftwidth=4
<<<<<<< HEAD
=======
" Author: Bailey Passmore

" Some pieces from:
" 	- https://www.freecodecamp.org/news/vimrc-configuration-guide-customize-your-vim-editor/
"	- https://github.com/tarakc02/dotfiles/nvim/vimrc

" Currently part of:
"	- https://github.com/baileyb0t/dotfiles

" from nvim-to-vim instructions
" may void some or all of the below lines?
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" LAYOUT ---------------------------------------------------------------- {{{ 
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side, relative to cursor position
set relativenumber number

" Highlight standard window edge with horizontal boundary
set colorcolumn=80

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=4
>>>>>>> a455cf2 (lots of changes, and things work now)

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" APPEARANCE ---------------------------------------------------------------- {{{
"status line via airline
let g:airline_section_b = '%-0.40{getcwd()}'
let g:airline_section_c = "%f"

"show buffers
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show=1

let g:molokai_term_italic = 1
let g:molokai_gui_italic = 1
let g:monochrome_italic_comments = 1
let g:gruvbox_italic = 1
let g:gruvbox_invert_tabline=1
colorscheme molokai

let rout_color_input    = 'guifg=#8f908a' "light grey
let rout_color_normal   = 'guifg=#eeeeec' "white
let rout_color_number   = 'guifg=#66d9ef' "teal
let rout_color_integer  = 'guifg=#66d9ef' "teal
let rout_color_float    = 'guifg=#66d9ef' "teal
let rout_color_complex  = 'guifg=#66d9ef' "teal
let rout_color_negnum   = 'guifg=#0b939b' "blue
let rout_color_negfloat = 'guifg=#0b939b' "blue
let rout_color_date     = 'guifg=#fce94f' "yellow
let rout_color_true     = 'guifg=#a6e22d' "green
let rout_color_false    = 'guifg=#f92772' "pink
let rout_color_inf      = 'guifg=#ffffff'
let rout_color_constant = 'guifg=#f92772' "pink
let rout_color_string   = 'guifg=#fce94f' "yellow
let rout_color_error    = 'guifg=#eeeeec guibg=#e73c50'
let rout_color_warn     = 'guifg=#e73c50'
let rout_color_index    = 'guifg=#8f908a'
"}}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/dotfiles/vim/plugged/')

<<<<<<< HEAD
   Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

   Plug 'dense-analysis/ale'
   
   Plug 'davidhalter/jedi-vim', { 'for':  'python' }

"   Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    
    " Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
    " - https://github.com/Valloric/YouCompleteMe
    " - https://github.com/nvim-lua/completion-nvim
"    let g:UltiSnipsEditSplit="vertical"
"    let g:UltiSnipsJumpForwardTrigger="<c-b>"
"    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

    " If you want :UltiSnipsEdit to split your window.
"    let g:UltiSnipsEditSplit="vertical"

call plug#end()

" }}}
=======

" Set tab width to 4 columns.
set tabstop=4

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" }}}

" APPEARANCE ---------------------------------------------------------------- {{{
"status line via airline
let g:airline_section_b = '%-0.40{getcwd()}'
let g:airline_section_c = "%f"

"show buffers
let g:airline_theme = 'gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show=1

let g:molokai_term_italic = 1
let g:molokai_gui_italic = 1
let g:monochrome_italic_comments = 1
let g:gruvbox_italic = 1
let g:gruvbox_invert_tabline=1
colorscheme molokai

let rout_color_input    = 'guifg=#8f908a' "light grey
let rout_color_normal   = 'guifg=#eeeeec' "white
let rout_color_number   = 'guifg=#66d9ef' "teal
let rout_color_integer  = 'guifg=#66d9ef' "teal
let rout_color_float    = 'guifg=#66d9ef' "teal
let rout_color_complex  = 'guifg=#66d9ef' "teal
let rout_color_negnum   = 'guifg=#0b939b' "blue
let rout_color_negfloat = 'guifg=#0b939b' "blue
let rout_color_date     = 'guifg=#fce94f' "yellow
let rout_color_true     = 'guifg=#a6e22d' "green
let rout_color_false    = 'guifg=#f92772' "pink
let rout_color_inf      = 'guifg=#ffffff'
let rout_color_constant = 'guifg=#f92772' "pink
let rout_color_string   = 'guifg=#fce94f' "yellow
let rout_color_error    = 'guifg=#eeeeec guibg=#e73c50'
let rout_color_warn     = 'guifg=#e73c50'
let rout_color_index    = 'guifg=#8f908a'
"}}}

" PLUGINS ---------------------------------------------------------------- {{{
========
" enable nvim spell check
set spelllang=en
"  }}}
>>>>>>>> a455cf2 (lots of changes, and things work now):nvim/init.vim

" ---- PLUGINS {{{
call plug#begin('~/dotfiles/vim/plugged/')
" aesthetic
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" filesystem
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }"
Plug 'sindrets/diffview.nvim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'gfanto/fzf-lsp.nvim'
Plug 'nvim-lua/plenary.nvim'

" atomic functionality
Plug 'windwp/nvim-autopairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" language-specific
Plug 'davidhalter/jedi-vim', { 'for':  'python' }
Plug 'jalvesaq/Nvim-R'
Plug 'jpalardy/vim-slime'   " run Julia REPL
Plug 'lervag/vimtex'   " make neovim support LaTeX
Plug 'kkharji/lspsaga.nvim'   " get LSP popups and docs

" BuildComposer {{{
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction
" }}}
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

" grand functionality
Plug 'jalvesaq/vimcmdline'
Plug 'dense-analysis/ale'
Plug 'neovim/nvim-lspconfig'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'lewis6991/spellsitter.nvim'
" lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty

Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}
" - shell repl
" - nvim lua api
" - scientific calculator
" - comment banner
" - etc

call plug#end()
"  }}}

" ---- PLUGIN SETUP {{{
" setup for gruvbox-material {{{
colorscheme gruvbox-material
"}}}

" setup for indent blank lines {{{
=======
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'dense-analysis/ale'
Plug 'davidhalter/jedi-vim', { 'for':  'python' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

Plug 'jalvesaq/vimcmdline'
Plug 'jalvesaq/Nvim-R'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
	
" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" For ultisnips users.
Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

call plug#end()

" setup for indent blank lines
>>>>>>> a455cf2 (lots of changes, and things work now)
lua << EOF
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
}
EOF
<<<<<<< HEAD
" }}}

" setup for autopairs {{{
lua << EOF
require("nvim-autopairs").setup {}
EOF
" }}}

" setup for coq_nvim {{{
let g:coq_settings = {"auto_start": v:true}
" }}}

" setup for nvim-lsputils {{{
lua << EOF
if vim.fn.has('nvim-0.5.1') == 1 then
    vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
    vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
    vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
    vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
    vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
    vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
    vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
    vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
else
    local bufnr = vim.api.nvim_buf_get_number(0)

    vim.lsp.handlers['textDocument/codeAction'] = function(_, _, actions)
        require('lsputil.codeAction').code_action_handler(nil, actions, nil, nil, nil)
    end

    vim.lsp.handlers['textDocument/references'] = function(_, _, result)
        require('lsputil.locations').references_handler(nil, result, { bufnr = bufnr }, nil)
    end

    vim.lsp.handlers['textDocument/definition'] = function(_, method, result)
        require('lsputil.locations').definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/declaration'] = function(_, method, result)
        require('lsputil.locations').declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/typeDefinition'] = function(_, method, result)
        require('lsputil.locations').typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/implementation'] = function(_, method, result)
        require('lsputil.locations').implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').document_handler(nil, result, { bufnr = bufn }, nil)
    end

    vim.lsp.handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').workspace_handler(nil, result, { bufnr = bufn }, nil)
    end
end
EOF
" }}}

" setup for nvim-lspconfig {{{
"local lspconfig = require('lspconfig')
"
"" Automatically start coq
"vim.g.coq_settings = { auto_start = 'shut-up' }
"
"" Enable some language servers with the additional completion capabilities offered by coq_nvim
"local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
"for _, lsp in ipairs(servers) do
"  lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({
"  }))
"end
" }}}

<<<<<<<< HEAD:nvim/prev_init.vim
" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$','\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
>>>>>>> parent of a455cf2 (lots of changes, and things work now)

=======

" setup for autopairs
lua << EOF
require("nvim-autopairs").setup {}
EOF


" ultisnips trigger configuration 
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"    let g:UltiSnipsEditSplit="vertical"


" setup for nvim-cmp
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'ultisnips' }, -- For ultisnips users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['python-lsp-server'].setup {
    capabilities = capabilities
  }
EOF

" }}}

>>>>>>> a455cf2 (lots of changes, and things work now)
" MAPPINGS --------------------------------------------------------------- {{{

" Set the backslash as the leader key.
"let mapleader = "\"

" Press \\ to jump back to the last cursor position.
"nnoremap <leader>\ ``

" Press \p to print the current file to the default printer from a Linux operating system.
" View available printers:   lpstat -v
" Set default printer:       lpoptions -d <printer_name>
" <silent> means do not display output.
"nnoremap <silent> <leader>p :%w !lp<CR>

" Type jj to exit insert mode quickly.
inoremap jj <Esc>

" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Pressing the letter o will open a new line below the current one.
" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

" Yank from cursor to the end of line.
nnoremap Y y$

" Map the F5 key to run a Python script inside Vim.
" I map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" You can split the window in Vim by typing :split or :vsplit.
" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$','\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
<<<<<<< HEAD
========
" setup for nvim-treesitter {{{
lua << EOF
require('nvim-treesitter').setup {
	highlight = {
		enable = true,
  },
}
EOF
" }}}
>>>>>>>> a455cf2 (lots of changes, and things work now):nvim/init.vim

" setup for spellsitter {{{
lua << EOF
require('spellsitter').setup{}
EOF
" }}}

" }}}

" ---- VIMSCRIPT {{{
" enable code folding with marker method {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
=======

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
>>>>>>> a455cf2 (lots of changes, and things work now)

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set the color scheme.
<<<<<<< HEAD
    colorscheme gruvbox-material
=======
    colorscheme molokai
>>>>>>> a455cf2 (lots of changes, and things work now)

    " Set a custom font you have installed on your computer.
    " Syntax: set guifont=<font_name>\ <font_weight>\ <size>
    set guifont=Monospace\ Regular\ 12

    " Display more of the file by default.
    " Hide the toolbar.
    set guioptions-=T

    " Hide the the left-side scroll bar.
    set guioptions-=L

    " Hide the the right-side scroll bar.
    set guioptions-=r

    " Hide the the menu bar.
    set guioptions-=m

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

" }}}

<<<<<<< HEAD
" ---- STATUS LINE ------------------------------------------------------------ {{{
=======
" STATUS LINE ------------------------------------------------------------ {{{
>>>>>>> a455cf2 (lots of changes, and things work now)

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}
<<<<<<< HEAD

" ---- MAPPINGS {{{
" spell check {{{
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>
" }}}

"}}}

" done.
=======
>>>>>>> a455cf2 (lots of changes, and things work now)

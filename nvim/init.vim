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

" enable nvim spell check
set spelllang=en
"  }}}

" ---- PLUGINS {{{
call plug#begin('~/dotfiles/vim/plugged/')
" aesthetic
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
"Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

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

" grand functionality
Plug 'jalvesaq/vimcmdline'
Plug 'dense-analysis/ale'
Plug 'neovim/nvim-lspconfig'
Plug 'RishabhRD/popfix'
Plug 'RishabhRD/nvim-lsputils'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'lewis6991/spellsitter.nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
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
lua << EOF
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    show_end_of_line = true,
    space_char_blankline = " ",
}
EOF
" }}}

" setup for autopairs {{{
lua << EOF
require("nvim-autopairs").setup {}
EOF
" }}}

" setup for coq_nvim {{{
let g:coq_settings = {"auto_start": v:true}
let g:coq_settings = { "keymap.recommended": v:true }
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

" setup for nvim-treesitter {{{
" lua << EOF
" require('nvim-treesitter').setup {
"	highlight = {
"		enable = true,
"  },
"}
"EOF
" }}}

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
    colorscheme gruvbox-material

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

" ---- STATUS LINE ------------------------------------------------------------ {{{

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

" ---- MAPPINGS {{{
" spell check {{{
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>
" }}}

"}}}

" done.

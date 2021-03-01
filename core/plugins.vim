scriptencoding utf-8
"{{ Autocompletion related plugins
"{ Plugin installation
"{{ Vim-plug related settings.
" The root directory to install all plugins.
let g:plugin_home=expand(stdpath('data') . '/plugged')
"}}
call plug#begin(g:plugin_home)
Plug 'machakann/vim-swap'
"{{ Search related plugins
" Super fast movement with vim-sneak
Plug 'justinmk/vim-sneak'

" Clear highlight search automatically for you
Plug 'romainl/vim-cool'

" Show current search term in different color
Plug 'PeterRincker/vim-searchlight'

" Show match number for incsearch
Plug 'osyo-manga/vim-anzu'

" Stay after pressing * and search selected text
Plug 'haya14busa/vim-asterisk'

" File search, tag search and more
if g:is_win
  Plug 'Yggdroot/LeaderF'
else
  Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
endif

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'NLKNguyen/papercolor-theme'
Plug 'lifepillar/vim-gruvbox8'
Plug 'ajmwagar/vim-deus'
Plug 'lifepillar/vim-solarized8'
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'sainnhe/edge'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'
Plug 'rakr/vim-one'

if !exists('g:started_by_firenvim')
  " colorful status line and theme
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
endif
"}}

"{{ Plugin to deal with URL
" Highlight URLs inside vim
Plug 'itchyny/vim-highlighturl'

" Automatic insertion and deletion of a pair of characters
Plug 'jiangmiao/auto-pairs'

" Comment plugin
Plug 'tpope/vim-commentary'


" Title character case
Plug 'christoomey/vim-titlecase'

" Autosave files on certain events
Plug '907th/vim-auto-save'

" Show undo history visually
Plug 'simnalamburt/vim-mundo'

Plug 'bfredl/nvim-miniyank'

" Handy unix command inside Vim (Rename, Move etc.)
Plug 'tpope/vim-eunuch'

" Repeat vim motions
Plug 'tpope/vim-repeat'

" Show the content of register in preview window
" Plug 'junegunn/vim-peekaboo'
Plug 'jdhao/better-escape.vim'
"}}

" Another linting plugin
Plug 'dense-analysis/ale'

" Auto format tools
Plug 'sbdchd/neoformat', { 'on': 'Neoformat' }
"}}

"{{ Git related plugins
" Show git change (change, delete, add) signs in vim sign column
Plug 'mhinz/vim-signify'
" Another similar plugin
" Plug 'airblade/vim-gitgutter'

" Git command inside vim
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
"}}

"{{ Plugins for markdown writing
" Another markdown plugin
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" Faster footnote generation
Plug 'vim-pandoc/vim-markdownfootnotes', { 'for': 'markdown' }

" Vim tabular plugin for manipulate tabular, required by markdown plugins
Plug 'godlygeek/tabular', {'on': 'Tabularize'}

" Markdown JSON header highlight plugin
Plug 'elzr/vim-json', { 'for': ['json', 'markdown'] }


Plug 'chrisbra/unicode.vim'
"}}

"{{ Text object plugins
" Additional powerful text object for vim, this plugin should be studied
" carefully to use its full power
Plug 'wellle/targets.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plugin to manipulate characer pairs quickly
" Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'

" Add indent object for vim (useful for languages like Python)
Plug 'michaeljsmith/vim-indent-object'
"}}

"{{ Tmux related plugins
" Since tmux is only available on Linux and Mac, we only enable these plugins
" for Linux and Mac
if executable('tmux')
  " Let vim detect tmux focus event correctly, see
  " https://github.com/neovim/neovim/issues/9486 and
  " https://vi.stackexchange.com/q/18515/15292
  Plug 'tmux-plugins/vim-tmux-focus-events'

  " .tmux.conf syntax highlighting and setting check
  Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }
endif
"}}

"{{ Misc plugins
" Modern matchit implementation
Plug 'andymass/vim-matchup'

" Smoothie motions
Plug 'psliwka/vim-smoothie'

Plug 'tpope/vim-scriptease'

" Asynchronous command execution
Plug 'skywind3000/asyncrun.vim'
" Another asynchronous plugin
" Plug 'tpope/vim-dispatch'
Plug 'cespare/vim-toml'

" Debugger plugin
if g:is_mac || g:is_linux
  Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh \| UpdateRemotePlugins' }
endif

" Session management plugin
Plug 'tpope/vim-obsession'

" Calculate statistics for visual selection
Plug 'wgurecky/vimSum'
if g:is_linux
  Plug 'ojroques/vim-oscyank'
endif
call plug#end()
"}}
"}

"{ Plugin settings
"{{ Vim-plug settings
" Use shortnames for common vim-plug command to reduce typing.
" To use these shortcut: first activate command line with `:`, then input the
" short alias, e.g., `pi`, then press <space>, the alias will be expanded
" to the full command automatically
call utils#Cabbrev('pi', 'PlugInstall')
call utils#Cabbrev('pud', 'PlugUpdate')
call utils#Cabbrev('pug', 'PlugUpgrade')
call utils#Cabbrev('ps', 'PlugStatus')
call utils#Cabbrev('pc', 'PlugClean')
"}}
"{{ Language specific plugin
"""""""""""""""""""""""""" semshi settings """""""""""""""""""""""""""""""
" Do not highlight for all occurances of variable under cursor
let g:semshi#mark_selected_nodes=0

" Do not show error sign since linting plugin is specicialized for that
let g:semshi#error_sign=v:false

"""""""""""""""""""""""""" vlime settings """"""""""""""""""""""""""""""""
command! -nargs=0 StartVlime call jobstart(printf("sbcl --load %s/vlime/lisp/start-vlime.lisp", g:plugin_home))

"}}

"{{ Search related
"""""""""""""""""""""""""""""vim-sneak settings"""""""""""""""""""""""
" Use sneak label mode
let g:sneak#label = 1

nmap f <Plug>Sneak_s
xmap f <Plug>Sneak_s
onoremap <silent> f :call sneak#wrap(v:operator, 2, 0, 1, 1)<CR>
nmap F <Plug>Sneak_S
xmap F <Plug>Sneak_S
onoremap <silent> F :call sneak#wrap(v:operator, 2, 1, 1, 1)<CR>

" Immediately after entering sneak mode, you can press f and F to go to next
" or previous match
let g:sneak#s_next = 1

"""""""""""""""""""""""""""""vim-anzu settings"""""""""""""""""""""""
nmap n <Plug>(anzu-n-with-echo)zzzv
nmap N <Plug>(anzu-N-with-echo)zzzv

" Maximum number of words to search
let g:anzu_search_limit = 500000

" Message to show for search pattern
let g:anzu_status_format = '/%p [%i/%l]'

"""""""""""""""""""""""""""""vim-asterisk settings"""""""""""""""""""""
nmap *  <Plug>(asterisk-z*)
nmap #  <Plug>(asterisk-z#)
xmap *  <Plug>(asterisk-z*)
xmap #  <Plug>(asterisk-z#)

"""""""""""""""""""""""""""""LeaderF settings"""""""""""""""""""""
" Do not use cache file
let g:Lf_UseCache = 0

" Ignore certain files and directories when searching files
let g:Lf_WildIgnore = {
  \ 'dir': ['.git', '__pycache__', '.DS_Store'],
  \ 'file': ['*.exe', '*.dll', '*.so', '*.o', '*.pyc', '*.jpg', '*.png',
  \ '*.gif', '*.svg', '*.ico', '*.db', '*.tgz', '*.tar.gz', '*.gz',
  \ '*.zip', '*.bin', '*.pptx', '*.xlsx', '*.docx', '*.pdf', '*.tmp',
  \ '*.wmv', '*.mkv', '*.mp4', '*.rmvb', '*.ttf', '*.ttc', '*.otf']
  \}

let g:Lf_ShowDevIcons = 1
" Only fuzzy-search files names
let g:Lf_DefaultMode = 'NameOnly'

let g:Lf_PopupColorscheme = 'gruvbox_default'

" Popup window settings
let g:Lf_PopupWidth = 0.5
let g:Lf_PopupPosition = [0, &columns/4]

" Do not use version control tool to list files under a directory since
" submodules are not searched by default.
let g:Lf_UseVersionControlTool = 0

" Disable default mapping
let g:Lf_ShortcutF = ''
let g:Lf_ShortcutB = ''

" set up working directory for git repository
let g:Lf_WorkingDirectoryMode = 'a'

" Search files in popup window
nnoremap <silent> <leader>f :<C-U>Leaderf file --popup<CR>
" Search vim help files
nnoremap <silent> <leader>h :<C-U>Leaderf help --popup<CR>
" Search tags in current buffer
nnoremap <silent> <leader>t :<C-U>Leaderf bufTag --popup<CR>
"}}

""""""""""""""""""""""""""" vista settings """"""""""""""""""""""""""""""""""
let g:vista#renderer#icons = {
      \ 'member': '',
      \ }

" Do not echo message on command line
let g:vista_echo_cursor = 0
" Stay in current window when vista window is opened
let g:vista_stay_on_open = 0

augroup matchup_conf
  autocmd!
  " Double mouse click to go to a tag
  autocmd FileType vista* nnoremap <buffer> <silent>
        \ <2-LeftMouse> :<C-U>call vista#cursor#FoldOrJump()<CR>
  " Quit Neovim if vista window is the only window
  autocmd BufEnter * call s:close_vista_win()
augroup END

nnoremap <silent> <Space>t :<C-U>Vista!!<CR>

function! s:close_vista_win() abort
  if winnr('$') == 1 && getbufvar(bufnr(), '&filetype') ==# 'vista'
    quit
  endif
endfunction
"}}

"{{ File editting
""""""""""""""""""""""""""""vim-titlecase settings"""""""""""""""""""""""
" Do not use the default mapping provided
let g:titlecase_map_keys = 0

nmap <leader>gt <Plug>Titlecase
xmap <leader>gt <Plug>Titlecase
nmap <leader>gT <Plug>TitlecaseLine

""""""""""""""""""""""""vim-auto-save settings"""""""""""""""""""""""
" Enable autosave on nvim startup
let g:auto_save = 1

" A list of events to trigger autosave
let g:auto_save_events = ['InsertLeave', 'TextChanged']

" Whether to show autosave status on command line
let g:auto_save_silent = 0

""""""""""""""""""""""""vim-mundo settings"""""""""""""""""""""""
let g:mundo_verbose_graph = 0
let g:mundo_width = 80

nnoremap <silent> <Space>u :MundoToggle<CR>

""""""""""""""""""""""""""""nvim-minipyank settings"""""""""""""""""""""""""
nmap p <Plug>(miniyank-autoput)
nmap P <Plug>(miniyank-autoPut)
"}}

"{{ Linting and formating
"""""""""""""""""""""""""""""" ale settings """""""""""""""""""""""
" linters for different filetypes
let g:ale_linters = {
  \ 'vim': ['vint'],
  \ }

" Only run linters in the g:ale_linters dictionary
let g:ale_linters_explicit = 1

" Linter signs
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'

"""""""""""""""""""""""""""""" neoformat settings """""""""""""""""""""""
let g:neoformat_enabled_python = ['black', 'yapf']
let g:neoformat_cpp_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['--style="{IndentWidth: 4}"']
      \ }
let g:neoformat_c_clangformat = {
      \ 'exe': 'clang-format',
      \ 'args': ['--style="{IndentWidth: 4}"']
      \ }

let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']
"}}

"{{ Git-related
"""""""""""""""""""""""""vim-signify settings""""""""""""""""""""""""""""""
" The VCS to use
let g:signify_vcs_list = [ 'git' ]

" Change the sign for certain operations
let g:signify_sign_change = '~'
"}}

"{{ Markdown writing
"""""""""""""""""""""""""plasticboy/vim-markdown settings"""""""""""""""""""
" Disable header folding
let g:vim_markdown_folding_disabled = 1

" Whether to use conceal feature in markdown
let g:vim_markdown_conceal = 1

" Disable math tex conceal and syntax highlight
let g:tex_conceal = ''
let g:vim_markdown_math = 0

" Support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" Let the TOC window autofit so that it doesn't take too much space
let g:vim_markdown_toc_autofit = 1

""""""""""""""""""""""""vim-grammarous settings""""""""""""""""""""""""""""""
if g:is_mac
  let g:grammarous#languagetool_cmd = 'languagetool'
  nmap <leader>x <Plug>(grammarous-close-info-window)
  nmap <c-n> <Plug>(grammarous-move-to-next-error)
  nmap <c-p> <Plug>(grammarous-move-to-previous-error)
  let g:grammarous#disabled_rules = {
      \ '*' : ['WHITESPACE_RULE', 'EN_QUOTES', 'ARROWS', 'SENTENCE_WHITESPACE',
      \        'WORD_CONTAINS_UNDERSCORE', 'COMMA_PARENTHESIS_WHITESPACE',
      \        'EN_UNPAIRED_BRACKETS', 'UPPERCASE_SENTENCE_START',
      \        'ENGLISH_WORD_REPEAT_BEGINNING_RULE', 'DASH_RULE', 'PLUS_MINUS',
      \        'PUNCTUATION_PARAGRAPH_END', 'MULTIPLICATION_SIGN', 'PRP_CHECKOUT',
      \        'CAN_CHECKOUT', 'SOME_OF_THE', 'DOUBLE_PUNCTUATION', 'HELL',
      \        'CURRENCY', 'POSSESSIVE_APOSTROPHE', 'ENGLISH_WORD_REPEAT_RULE',
      \        'NON_STANDARD_WORD', 'AU'],
      \ }
endif

""""""""""""""""""""""""unicode.vim settings""""""""""""""""""""""""""""""
nmap ga <Plug>(UnicodeGA)

"{{ text objects
""""""""""""""""""""""""""""vim-sandwich settings"""""""""""""""""""""""""""""
" Map s to nop since s in used by vim-sandwich. Use cl instead of s.
nmap s <Nop>
omap s <Nop>
"}}

"{{ UI: Status line, look
"""""""""""""""""""""""""""vim-airline setting""""""""""""""""""""""""""""""
" Set airline theme to a random one if it exists
let s:candidate_airlinetheme = ['onedark', 'ayu_mirage', 'lucius', 'ayu_dark', 'base16_bright',
      \ 'base16_adwaita', 'jellybeans', 'luna', 'raven', 'term', 'base16_summerfruit']
let s:theme = s:candidate_airlinetheme[0]

if utils#HasAirlinetheme(s:theme)
  let g:airline_theme=s:theme
endif

" Tabline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Show buffer number for easier switching between buffer,
" see https://github.com/vim-airline/vim-airline/issues/1149
let g:airline#extensions#tabline#buffer_nr_show = 1

" Buffer number display format
let g:airline#extensions#tabline#buffer_nr_format = '%s. '

" Whether to show function or other tags on status line
let g:airline#extensions#vista#enabled = 1
let g:airline#extensions#gutentags#enabled = 1

" Do not show search index in statusline since it is shown on command line
let g:airline#extensions#anzu#enabled = 0

" Enable vim-airline extension for vim-lsp
let g:airline#extensions#lsp#enabled = 1

" Skip empty sections if there are nothing to show,
" extracted from https://vi.stackexchange.com/a/9637/15292
let g:airline_skip_empty_sections = 1

" Whether to use powerline symbols, see https://vi.stackexchange.com/q/3359/15292
let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'

" Only show git hunks which are non-zero
let g:airline#extensions#hunks#non_zero_only = 1

" Speed up airline
let g:airline_highlighting_cache = 1

""""""""""""""""""""""""""""vim-startify settings""""""""""""""""""""""""""""
" Do not change working directory when opening files.
let g:startify_change_to_dir = 0
let g:startify_fortune_use_unicode = 1

"}}

"{{ Misc plugin setting
""""""""""""""""""""""""""""vim-matchup settings"""""""""""""""""""""""""""""
" Improve performance
let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_timeout = 100
let g:matchup_matchparen_insert_timeout = 30

" Enhanced matching with matchup plugin
let g:matchup_override_vimtex = 1

" Whether to enable matching inside comment or string
let g:matchup_delim_noskips = 0

" Show offscreen match pair in popup window
let g:matchup_matchparen_offscreen = {'method': 'popup'}

" Change highlight color of matching bracket for better visual effects
augroup matchup_matchparen_highlight
  autocmd!
  autocmd ColorScheme * highlight MatchParen cterm=underline gui=underline
augroup END

" Show matching keyword as underlined text to reduce color clutter
augroup matchup_matchword_highlight
  autocmd!
  autocmd ColorScheme * hi MatchWord cterm=underline gui=underline
augroup END

"""""""""""""""""""""""""" asyncrun.vim settings """"""""""""""""""""""""""
" Automatically open quickfix window of 6 line tall after asyncrun starts
let g:asyncrun_open = 6
if g:is_win
  " Command output encoding for Windows
  let g:asyncrun_encs = 'gbk'
endif

""""""""""""""""""""""""""""""firenvim settings""""""""""""""""""""""""""""""
if exists('g:started_by_firenvim') && g:started_by_firenvim
  " general options
  set laststatus=0 nonumber noruler noshowcmd

  " general config for firenvim
  let g:firenvim_config = {
      \ 'globalSettings': {
          \ 'alt': 'all',
      \  },
      \ 'localSettings': {
          \ '.*': {
              \ 'cmdline': 'neovim',
              \ 'priority': 0,
              \ 'selector': 'textarea',
              \ 'takeover': 'never',
          \ },
      \ }
  \ }

  augroup firenvim
    autocmd!
    autocmd BufEnter *.txt setlocal filetype=markdown
  augroup END
endif

""""""""""""""""""""""""""""""nvim-gdb settings""""""""""""""""""""""""""""""
nnoremap <leader>dp :<C-U>GdbStartPDB python -m pdb %<CR>
"}}
"}

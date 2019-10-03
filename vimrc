" ------------------------------------------------------------------

"   -------------------------------
"   1.  GENERAL CONFIGURATION
"   -------------------------------

"   Activate pathogen
"   ------------------------------------------------------------
    execute pathogen#infect()

"   Check for indentation rules in after/ftplugin
"   ------------------------------------------------------------
    filetype plugin indent on

"   Use solarized color theme
"   ------------------------------------------------------------
    syntax on
    let g:solarized_termcolors=1
    set background=dark
    colorscheme solarized

"   Set-up relative and absolute line number handling
"   ------------------------------------------------------------
    set number
    set relativenumber

"   General settings
"   ------------------------------------------------------------
    set nowrap        " don't wrap lines
    set tabstop=4     " a tab is four spaces
    set shiftwidth=4  " number of spaces to use for autoindenting
    set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
    set backspace=indent,eol,start
                         " allow backspacing over everything in insert mode
    set autoindent    " always set autoindenting on
    set copyindent    " copy the previous indentation on autoindenting
    set smarttab      " insert tabs on the start of a line according to
                      "    shiftwidth not tabstop
    set expandtab
    set showmatch     " set show matching parenthesis
    set ignorecase    " ignore case when searching
    set smartcase     " ignore case if search pattern is all lowercase,
    		      "    case-sensitive otherwise
    set hlsearch      " highlight search terms
    set incsearch     " show search matches as you type
    set clipboard=unnamed
    					" let * register be available for copying to clipboard
    set encoding=utf-8



"   Key mappings
"   ------------------------------------------------------------
    " change the mapleader from \ to ,
    let mapleader=","

    " Quickly edit/reload the vimrc file
    nmap <silent> <leader>ev :e $MYVIMRC<CR>
    nmap <silent> <leader>sv :so $MYVIMRC<CR>

    " Make 0 go to the first character rather than the beginning
    " of the line. When we're programming, we're almost always
    " interested in working with text rather than empty space. If
    " you want the traditional beginning of line, use ^
    nnoremap 0 ^
    nnoremap ^ 0

    " copy current filename into system clipboard - mnemonic: (c)urrent(f)ilename
    " this is helpful to paste someone the path you're looking at
    nnoremap <silent> <leader>cf :let @* = expand("%:~")<CR>
    nnoremap <silent> <leader>cn :let @* = expand("%:t")<CR>

    "Clear current search highlight by double tapping //
    nmap <silent> // :nohlsearch<CR>

    "(v)im (r)eload
    nmap <silent> <leader>vr :so %<CR>

"   surround.vim
"   ------------------------------------------------------------
    " ," Surround a word with "quotes"
    map <leader>" ysiw"
    vmap <leader>" c"<C-R>""<ESC>

    " ,' Surround a word with 'single quotes'
    map <leader>' ysiw'
    vmap <leader>' c'<C-R>"'<ESC>

    " ,) or ,( Surround a word with (parens)
    " The difference is in whether a space is put in
    map <leader>( ysiw(
    map <leader>) ysiw)
    vmap <leader>( c( <C-R>" )<ESC>
    vmap <leader>) c(<C-R>")<ESC>

    " ,[ Surround a word with [brackets]
    map <leader>] ysiw]
    map <leader>[ ysiw[
    vmap <leader>[ c[ <C-R>" ]<ESC>
    vmap <leader>] c[<C-R>"]<ESC>

    " ,{ Surround a word with {braces}
    map <leader>} ysiw}
    map <leader>{ ysiw{
    vmap <leader>} c{ <C-R>" }<ESC>
    vmap <leader>{ c{<C-R>"}<ESC>

"   nerdtree.vim & vim-nerdtree-tabs.vim
"   ------------------------------------------------------------
    " Make nerdtree look nice
    let NERDTreeMinimalUI = 1
    let NERDTreeDirArrows = 1
    let g:NERDTreeWinSize = 30
    " Auto open nerd tree on startup
    let g:nerdtree_tabs_open_on_gui_startup = 0
    " Focus in the main content window
    let g:nerdtree_tabs_focus_on_files = 1

    " Open the project tree and expose current file in the nerdtree with Ctrl-\
    " " calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
    function! OpenNerdTree()
        if &modifiable && strlen(expand('%')) > 0 && !&diff
            NERDTreeFind
            NERDTreeTabsOpen
        else
            NERDTreeTabsToggle
        endif
    endfunction
    nnoremap <silent> <C-\> :call OpenNerdTree()<CR>

    " Window manipulation
    " Move between split windows by using the four directions H, L, K, J
    nnoremap <silent> <C-h> <C-w>h
    nnoremap <silent> <C-l> <C-w>l
    nnoremap <silent> <C-k> <C-w>k
    nnoremap <silent> <C-j> <C-w>j

"   Strip trailing whitespace
"   ------------------------------------------------------------
   function! <SID>StripTrailingWhitespaces()
		" Preparation: save last search, and cursor position.
		let _s=@/
		let l = line(".")
		let c = col(".")
		" Do the business:
		%s/\s\+$//e
		" Clean up: restore previous search history, and cursor position
		let @/=_s
		call cursor(l, c)
   endfunction
   autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

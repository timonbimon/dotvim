" ------------------------------------------------------------------

"   -------------------------------
"   1.  GENERAL CONFIGURATION
"   -------------------------------

"   Activate pathogen
"   ------------------------------------------------------------
    execute pathogen#infect()

"   Check for indentation rules in after/ftplugin 
"   ------------------------------------------------------------
    autocmd filetype plugin indent on

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
    set backspace=indent,eol,start
                         " allow backspacing over everything in insert mode
    set autoindent    " always set autoindenting on
    set copyindent    " copy the previous indentation on autoindenting
    set shiftwidth=4  " number of spaces to use for autoindenting
    set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
    set showmatch     " set show matching parenthesis
    set ignorecase    " ignore case when searching
    set smartcase     " ignore case if search pattern is all lowercase,
    		      "    case-sensitive otherwise
    set smarttab      " insert tabs on the start of a line according to
                      "    shiftwidth not tabstop
    set hlsearch      " highlight search terms
    set incsearch     " show search matches as you type
    set clipboard=unnamed 
    					" let * register be available for copying to clipboard
    

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
                 
   

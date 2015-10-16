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
    let g:solarized_termcolors=256
    set t_Co=256 
    set background=dark
    colorscheme solarized   
   

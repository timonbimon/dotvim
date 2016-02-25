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
    function! NumberToggle()
      if(&relativenumber == 1)
         set number
      elseif(&number == 1)
         set nonumber
      else
         set relativenumber
      endif
    endfunc
    
    nnoremap <C-n> :call NumberToggle()<cr>
    :au FocusLost * :set number
    :au FocusGained * :set relativenumber
    autocmd InsertEnter * :set number
    autocmd InsertLeave * :set relativenumber

                 
   

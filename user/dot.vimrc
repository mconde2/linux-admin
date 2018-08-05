
" Basic tab handling for all files (exception for Makefiles is elsewhere)
" This is a function so it can be called during execution to conform to
" the existing style of a source file.
function SetTabSize(tabsize)
    execute "set tabstop=".a:tabsize
    execute "set shiftwidth=".a:tabsize
    execute "set softtabstop=".a:tabsize

    return
endfunction

" Change status line color based on mode
function StatuslineColor(mode)
    if a:mode == 'i'
        hi statusline cterm=NONE ctermbg=green
    elseif a:mode == 'r'
        hi statusline cterm=NONE ctermbg=blue
    else
        hi statusline cterm=NONE ctermbg=magenta
    endif
endfunction

" Most vims have autocmd these days, but some basic embedded ones don't...
if has("autocmd")
    " Use filetype detection and file-based automatic indenting.
    filetype plugin indent on

    " Use hard tabs in Makefiles
    autocmd FileType make set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab

    " Change status line based on mode
    autocmd InsertEnter * call StatuslineColor(v:insertmode)
    autocmd InsertChange * call StatuslineColor(v:insertmode)
    autocmd InsertLeave * hi statusline ctermbg=red
endif

" Tab settings
call SetTabSize(4)
set expandtab           " Expand TABs to spaces
set autoindent
set smartindent

" Visual preferences
set bg=dark
syntax on
set hlsearch
hi Search cterm=NONE ctermfg=grey ctermbg=blue
hi statusline cterm=NONE ctermbg=red
set cursorline

" Informative status line
set statusline=%F%m%r%h%w\ [TYPE=%y\ \%{&ff}]\ [%4l,%3v]\ [%3p%%]\ [%L]
set laststatus=2

" Characters to use for showing whitespace with :set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" The red line that must not be crossed!
if exists('+colorcolumn')
    set cc=81
endif

" Friendly ctags support
set tags=./tags;~/projects

" Load pathogen for bundle package management
"execute pathogen#infect()
                                                                                
" "mode" must be "passive" to get automatic synstastic run-on-save for active
" filetypes.
let g:syntastic_mode_map = {
         \"mode": "passive",
         \"active_filetypes":
         \   ["python", "c", "cpp", "ruby", "perl", "make", "vim"],
         \"passive_filetypes": []
         \}

" To display together the errors found by all checkers enabled for the current
" file.
let g:syntastic_aggregate_errors = 1

" This allows diagnostics from syntastic to be stored in vim's locationlist,
" which can be opened with ':lopen' and ':lclose'.
let g:syntastic_always_populate_loc_list = 1

" The YCM documentation says to do this; it looks suspiciously like the
" syntastic option of similar name.
"let g:ycm_always_populate_loc_list = 1

" Tell YCM not to ask before loading an extra_conf file.
"let g:ycm_confirm_extra_conf = 0


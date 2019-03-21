
" This must be first, because it changes other options as a side effect.
set nocompatible

" appearance
set background=dark
" turn hybrid line numbers on
set number relativenumber
set nu rnu
" show ruler at the button
set ruler
"" Other configurations
set hidden      " multiple buffers
set ignorecase  " ignore case in searches
set linebreak   " wrap after words
set smartcase   " match case once specified
"set spell       " always spell check
set visualbell  " no sound
set autowrite   " write files when leaving
"set nobackup
"set nowritebackup
"set noswapfile
set statusline=%f

""""""""""""""""""""""""""""""
" => Status line
" from https://github.com/amix/vimrc
" """"""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


" https://www.youtube.com/watch?v=XA2WjJbmmoM

syntax enable
filetype plugin on
":hi SpellBad cterm=underline

" FINDING FILES:

" search down into subfolders
" Provide tab-completion for all file related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
"  - :b lets you autocomplete

" TAG JUMPING:

" Create the `tags` file
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags

" AUTOCOMPLETE:
" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list.


"if has('mouse')
"  set mouse=a
"endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
\ endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
" """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


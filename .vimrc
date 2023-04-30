
# Setup Linux style conventions
au BufReadPre *.c setlocal cindent ts=8 sts=8 sw=8
au BufWritePre *.c %s/\s*$/

set nu relativenumber
syntax on
filetype indent plugin on

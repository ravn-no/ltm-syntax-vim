# ltm-syntax-vim

Repository moved from (http://software.ravn.no/syntax-highlighting/vim-ltm/)

This distribution contains vim syntax hightlighting for the
Linear Topic Map Notation.

See <http://www.ontopia.net/download/ltm.html> for more information about
LTM 1.3.

To install the syntax highlighting, copy the ltm.vim file to your
.vim/syntax directory.

You can then activate the hightlighting in vim with
:set syntax=ltm

If you want to automatically highlight .ltm-files, create a file called
"filetype.vim" in your .vim directory with the following contents:

"------
augroup filetypedetect
au BufNewFile,BufRead *.ltm                 setf ltm
augroup END
"------

Have fun!

Jan Schreiber

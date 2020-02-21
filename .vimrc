" Guarda posicao do cursor e historico da linha de comando :
set viminfo='10,\"30,:40,%,n~/.viminfo
au BufReadPost * if line("'\"")|execute("normal `\"")|endif

" MostraTab: mostra TAB no inicio e espacos no fim das linhas
map ,mt /^\t\+\\|\s\+$<cr>

set sm                          "ShowMatch: mostra o par do parenteses/chaves recem fechado
set hid                         "HIDden: nao lembro pra que servia mas era massa
set aw                          "AutoWrite: gravacao automatica a cada alteracao
"set ai                         "AutoIndent: identacao automatica
"set ts=4                       "TabStop: numero de caracteres de avanco do TAB
set report=0                    "Reporta acoes com linhas
set shm=filmnrwxt               "SHortMessages: encurta as mensagem do rodape
set et                          "ExpandTab: troca TABs por espacos
retab                           "Converter os TABs ja existentes
set ruler                       "Mostra a posicao do cursor, regua
"set showcmd                    "Mostra o comando sendo executado
set laststatus=2                "Mostra N linhas de estado (status)
"set textwidth=70               "Quebra de linha
set bs=0                        "Comportamento do backspace
set nosmartindent               "Desligando pois esta padrao no CL40
"set visualbell                 "Pisca a tela ao inves de bipar
"set wrap                       "Forca a quebra de linha
set nojoinspaces                "! coloca 2 espacos apos o . quando usando o gq
set sw=1                        "Numero de colunas para o comando > (ShiftWidth)
set wildmode=longest,list:full  "Para completacao do TAB igual bash


" Cores no terminal com a sintaxe
set background=dark
" Acho que essa tosquice toda nao eh mais necessaria
" t_Co número de cores / t_Sb tipo de cor do fundo / t_Sf tipo de cor da fonte
"if has("terminfo")
"  set t_Co=8
"  set t_Sf=[3%p1%dm
"  set t_Sb=[4%p1%dm
"else
"  set t_Co=8
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"endif
syntax on               "ligando a sintaxe colorida
colorscheme elflord
syn sync minlines=500


" Comandos
"
" Palavras-chave para destacar em qualquer tipo de arquivo
syn case ignore
hi p_c ctermbg=white ctermfg=black

" Man: Paginas de manual sao na verdade textos em NROFF 
au BufNewFile,BufRead *.man set ft=nroff

" TXT: Arquivos texto tem tratamento especial
au BufNewFile,BufRead *.txt   set ts=8 ft=txt "spell
au BufNewFile,BufRead *README,*NEWS,*TODO set ft=txt "spell

" Makefile: ele adora usar linhas compridas malas
au BufNewFile,BufRead Makefile set tw=0

" Markdown
au BufNewFile,BufRead *.md   set ft=markdown

" Mostra os espaços em branco inúteis no final da linha 
au BufNewFile,BufRead * syn match brancomala '\s\+$' | hi brancomala ctermbg=red

" Guardar info da sintaxe desde o inicio do arquivo (nao se perde, fica lento)
syn sync fromstart
" Barra de espaço mapeado para PageDown no modo de comandos
noremap <Space> <PageDown>

autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0


    "reset augroup
    augroup MyAutoCmd
        autocmd!
    augroup END

    language en_US.utf-8
    set encoding=utf-8
    scriptencoding utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-boms,utf-8,euc-jp,cp932
    set fileformats=unix,dos,mac
    " set ambiwidth=double
    set expandtab
    set tabstop=4
    set softtabstop=4
    set noautoindent
    set smartindent
    set shiftwidth=4
    set incsearch
    set noignorecase
    set hlsearch
    nnoremap <silent><Esc><Esc> : <C-u> set nohlsearch!<CR>
    set title
    set number
    set cursorline
    set showtabline=1
    set pumblend=10
    set winblend=10
    set updatetime=300
    nnoremap j gj
    nnoremap k gk
    nnoremap <down> gj
    nnoremap <up> gk
    set backspace=indent,eol,start
    set showmatch
    source $VIMRUNTIME/macros/matchit.vim
    set wildmenu
    set history=5000
    set laststatus=2
    set showmode
    set ruler
    set showcmd
    " set foldmethod=indent
    set nofoldenable
    set nomodeline
    set mouse=a
    set clipboard=unnamedplus
    set directory=/tmp/vim/swapfile/
    set swapfile
    " set backupdir=/tmp/vim/backup/
    set nobackup
    set guifont='JetBrainsMono\ Nerd\ Font\ Regular\ 11'
    set guioptions+=m

    filetype on
    let g:filetype_m='objc'
    augroup FileTypeSetting
        au BufNewFile,BufRead *.mm setf objcpp
        au BufNewFile,BufRead *.gas setf asm
        au BufNewFile,BufRead *.ros setf lisp
        au BufNewFile,BufRead *.dart setf dart
        au BufNewFile,BufRead *.jl setf julia
        au FileType dart set shiftwidth=2 tabstop=2 softtabstop=2
        au FileType yaml set shiftwidth=2 tabstop=2 softtabstop=2
        au FileType ruby set shiftwidth=2 tabstop=2 softtabstop=2
        au FileType json set conceallevel=0
        au FileType python let b:coc_root_patterns = ['.git', '.env']
    augroup END
    let g:tex_conceal=''

    cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

    nnoremap <C-t> :terminal <CR>
    tnoremap <C-w> <C-\><C-n><C-w>
    " au TermOpen * startinsert

    let g:python3_host_prog=expand('~/.pyenv/shims/python')
    let g:ruby_host_prog=expand('~/.rbenv/shims/ruby')

    let s:dein_dir=expand('~/.cache/dein')
    let s:dein_repo_dir=s:dein_dir . '/repos/github.com/Shougo/dein.vim'

    " fetch from github
    if &runtimepath!~#'/dein.vim'
        if !isdirectory(s:dein_repo_dir)
            execute '!git clone http://github.com/Shougo/dein.vim' s:dein_repo_dir
        endif
        execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir,':p')
    endif

    source ~/.config/nvim/github_token.vim
    if dein#load_state(s:dein_dir)
        call dein#begin(s:dein_dir)

        let g:rc_dir=expand('~/.config/nvim')

        let s:toml=g:rc_dir . '/dein.toml'
        let s:lazy_toml=g:rc_dir . '/dein_lazy.toml'
        call dein#load_toml(s:toml,{'lazy':0})
        call dein#load_toml(s:lazy_toml,{'lazy':1})

        call dein#end()
        call dein#save_state()
    endif

    if dein#check_install()
        call dein#install()
    endif

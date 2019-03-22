
    "reset augroup
    augroup MyAutoCmd
        autocmd!
    augroup END

    "utf-8でコーディング
    set encoding=utf-8
    scriptencoding utf-8
    "保存時の文字コード
    set fileencoding=utf-8
    "読み込み時の文字コードを自動判別 左:優先
    set fileencodings=ucs-boms,utf-8,euc-jp,cp932
    "改行コード自動判別
    set fileformats=unix,dos,mac
    "□○が崩れるのを解決
    set ambiwidth=double
    "タブ入力を複数の空白で置き換える
    set expandtab
    "画面上でタブ文字の占める幅
    set tabstop=4
    "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
    set softtabstop=4
    "改行時に前の行のインデントを継続する
    set noautoindent
    "行ごとに前の構文をチェックし、次の行のインデントを増減する
    set smartindent
    "smartindentで増減する幅
    set shiftwidth=4
    "インクリメンタルサーチ:1文字ごとに検索を行う
    set incsearch
    "検索パターンに大文字小文字を区別しない
    set ignorecase
    "検索パターンに大文字を含んでいたら大文字小文字を区別する
    set hlsearch
    "ESCキー2度押しでハイライトの切り替え
    nnoremap <silent><Esc><Esc> : <C-u> set nohlsearch!<CR>
    "編集中のファイル名を表示
    set title
    "行番号表示
    set number
    "カーソルラインをハイライト
    set cursorline
    "タブラインを常に表示
    set showtabline=1
    "行が折り返し表示されていた場合、行単位でなく表示単位でカーソル移動する
    nnoremap j gj
    nnoremap k gk
    nnoremap <down> gj
    nnoremap <up> gk
    "バックスペース有効化
    set backspace=indent,eol,start
    "括弧の対応関係を表示
    set showmatch
    "%の機能を拡張 ノーマルモードで%に対応するタグにジャンプできる
    source $VIMRUNTIME/macros/matchit.vim
    "コマンドモードの補完
    set wildmenu
    "保存するコマンドの履歴数 コマンド補完を可視化
    set history=5000
    "スワップファイルを作らない
    set noswapfile
    "常にステータスラインを表示
    set laststatus=2
    "現在のモードを表示
    set showmode
    "ステータスラインの右側に現在位置を表示する
    set ruler
    "打ったコマンドをステータスラインの下に表示
    set showcmd
    "テキストの折りたたみを有効化
    " set foldmethod=indent
    set nofoldenable
    set nomodeline
    set mouse=a
    " ファイルタイプの検出
    filetype on
    " .mファイルはobjc
    let g:filetype_m='objc'
    " .mmファイルはobjcpp
    au BufNewFile,BufRead *.mm setf objcpp
    " .tsファイルはtypescript
    au BufNewFile,BufRead *.ts setf typescript
    " .qmlファイルはqml
    au BufNewFile,BufRead *.qml setf qml

    "sudoで保存
    cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

    nnoremap <C-t> :terminal <CR>
    tnoremap <C-w> <C-\><C-n><C-w>
    " au TermOpen * startinsert

    "python3
    let g:python3_host_prog=expand('~/anaconda3/bin/python3')

    "ruby
    let g:ruby_host_prog='/usr/bin/ruby'

    "プラグインがインストールされるディレクトリ
    let s:dein_dir=expand('~/.cache/dein')
    "dein.vim 本体
    let s:dein_repo_dir=s:dein_dir . '/repos/github.com/Shougo/dein.vim'

    "deinがなければgithubから落としてくる
    if &runtimepath!~#'/dein.vim'
        if !isdirectory(s:dein_repo_dir)
            execute '!git clone http://github.com/Shougo/dein.vim' s:dein_repo_dir
        endif
        execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir,':p')
    endif

    "設定
    if dein#load_state(s:dein_dir)
        call dein#begin(s:dein_dir)

        "プラグインリストを収めたTOMLファイル
        "予めTOMLファイルを用意しておく

        let g:rc_dir=expand('~/.config/nvim')
        let s:toml=g:rc_dir . '/dein.toml'
        let s:lazy_toml=g:rc_dir . '/dein_lazy.toml'
        "TOMLを読み込み、キャッシュしておく
        call dein#load_toml(s:toml,{'lazy':0})
        call dein#load_toml(s:lazy_toml,{'lazy':1})
        "設定終了
        call dein#end()
        call dein#save_state()
    endif

    "もしインストールしていないものがあったらインストール
    if dein#check_install()
        call dein#install()
    endif

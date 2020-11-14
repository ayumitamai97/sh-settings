command! Relp let @+ = join([expand("%"), line(".")], ":")
command! Fulp let @+ = expand("%:p")
command! Cdc lcd %:p:h
cnoreabbrev rp Relp
cnoreabbrev fp Fulp
cnoreabbrev cdc Cdc

let &shell=$SHELL." --login"

if has('nvim')
  " exitフックを指定して:terminalを開く
  function! s:termopen_wrapper(on_exit) abort
    call termopen($SHELL, {'on_exit': function(a:on_exit)})
  endfunction

  " terminalの終了時にバッファを消すフック
  function! s:onTermExit(job_id, code, event) dict
    " Process Exitが表示されたその後cr打つとバッファが無くなるので
    " それと同じようにする
    call feedkeys("\<CR>")
  endfun

  " 水平分割でexit時に自動でcloseする行数sizeのターミナルバッファ表示
  function! TermHelper(...) abort
    let h_or_v = get(a:, 1, 'h') "デフォルトは水平分割
    let size = get(a:, 2, 15) "デフォルトは高さ(or幅)15のウィンドウ

    if h_or_v == 'h'
      "topleft new | call s:termopen_wrapper('s:onTermExit')
      botright new | Eterminal
      execute 'resize ' . size
    else
      "vertical botright new | call s:termopen_wrapper('s:onTermExit')
      vertical botright new | Eterminal
      execute 'vertical resize ' . size
    endif
  endfun

  " 水平ウィンドウ分割してターミナル表示 引数はwindowの行数指定(Horizontal terminal)
  command! -count=20 Hterminal :call TermHelper('h', <count>)
  cnoreabbrev hter Hterminal
  " 垂直ウィンドウ分割してターミナル表示 引数はwindowの行数指定(Vertical terminal)
  command! -count=80 Vterminal :call TermHelper('v', <count>)
  cnoreabbrev vter Vterminal
else
  set termwinsize=20x0
endif

set history=10000

if has('vim')
  let TermRspec = 'ter++noclose bundle exec rspec'
  command RspecFile execute join([TermRspec, expand('%')])
  cnoreabbrev rspf RspecFile
  command RspecCase execute join([TermRspec, join([expand('%'), line('.')], ':')])
  cnoreabbrev rspc RspecCase
  command Rubo ter++noclose bundle exec rubocop -a
  cnoreabbrev rubo Rubo
  command Eslint ter++noclose yarn run eslint --fix
  cnoreabbrev eslint Eslint
  command Stylelint ter++noclose yarn run stylelint --fix
  cnoreabbrev stylelint Stylelint
" elseif has('nvim')
"   let TermRspec = 'hter bundle exec rspec'
"   command RspecFile execute join([TermRspec, expand('%')])
"   cnoreabbrev rspf RspecFile
"   command RspecCase execute join([TermRspec, join([expand('%'), line('.')], ':')])
"   cnoreabbrev rspc RspecCase
end

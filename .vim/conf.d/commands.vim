command! Relp let @+ = join([expand("%"), line(".")], ":")
command! Fulp let @+ = expand("%:p")
command! Cdc lcd %:p:h
cnoreabbrev rp Relp
cnoreabbrev fp Fulp
cnoreabbrev cdc Cdc

set history=10000

let &shell=$SHELL." --login"

if has('nvim')
  let TermRspec = 'botright T bundle exec rspec'
  command RspecFile execute join([TermRspec, expand('%')])
  cnoreabbrev rspf RspecFile
  command RspecCase execute join([TermRspec, join([expand('%'), line('.')], ':')])
  cnoreabbrev rspc RspecCase
  command Rubo botright T bundle exec rubocop -A
  cnoreabbrev rubo Rubo
endif

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

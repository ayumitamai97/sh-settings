" Commands, abbreviations
command Rp let @+ = join([expand("%"), line(".")], ":")
command Fp let @+ = expand("%:p")
command Cdc lcd %:p:h " 今開いているファイルのディレクトリにlcdする
cnoreabbrev cdc Cdc

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
end

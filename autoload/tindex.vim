scriptencoding utf-8

if !exists('g:loaded_tindex')
  finish
else
  let g:loaded_tindex = 1
endif

let s:save_cpo = &cpo
set cpo&vim

function! s:parser10(txt) " 作りかけ
    return s:retf10(a:txt, "")
endfunction

function! tindex#tindex_init()
endfunction

" reft10(iter:入力値, ret:返り値)
function! s:retf10(iter, ret)
  if strlen(a:iter) == 0
    return a:ret
  endif
  let l:element = a:iter[0]
  if l:element == '$'
    let l:buf = []
    for l:e in split(a:iter, '\zs')
      let l:buf = add(l:buf, l:e)
      if l:e == '}'
        break
      endif
    endfor
    if matchstr(join(l:buf, ''), '\$\\{[0-9]+:.+\\}') >= 0
      return s:retf10(a:iter[len(l:buf):], a:ret)
    endif
  endif
  return s:retf10(a:iter[1:], a:ret . l:element)
endfunction

function! s:t20_exit_buf()
    let ctext =  "\\" . s:parser10(split(getline('.'), ',')[0])
    execute  "quit"
    execute "normal! a" . ctext . "\<Esc>"
endfunction

function! tindex#m_math_glossary()
    let buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(buf, 0, 0, v:true, map(readfile(glob(g:tindex#index_path)), {_, a->substitute(a, '"', '', 'g')}) )
    let opts = {'relative': 'cursor', 'width': 30, 'height': 15, 'col': 0,
                \ 'row': 1, 'anchor': 'NW', 'style': 'minimal'}
    let win = nvim_open_win(buf, 1, opts)
    " optional: change highlight, otherwise Pmenu is used
    call nvim_win_set_option(win, 'winhl', 'Normal:MMathGlossary')

    command! TCommands call s:t20_exit_buf()
    nnoremap <buffer> <silent> ,t :TCommands<CR>
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

scriptencoding utf-8

if !exists('g:loaded_tindex')
  finish
else
  let g:loaded_tindex = 1
endif

let s:save_cpo = &cpo
set cpo&vim

function! vim_tindex#tindex_init()
  " Shell Command execution {{{
  " Compile Latex
  function! s:compile_latex()
    if expand("%") == 'l02.tex' || expand("%") == 'l03.tex'
      function! s:OnEvent(job_id, data, event) dict
        if a:event == 'stdout'
          let str = self.shell.' stdout: '.join(a:data)
        elseif a:event == 'stderr'
          let str = self.shell.' stderr: '.join(a:data)
          echo str
        else
          let str = self.shell.' exited'
        endif
      endfunction
      let s:callbacks = {
            \ 'on_stdout': function('s:OnEvent'),
            \ 'on_stderr': function('s:OnEvent'),
            \ 'on_exit': function('s:OnEvent')
            \ }
      let s:job1 = jobstart(['zsh', '-c', 'lualatex ' . expand('%:r')], extend({'shell': 'shell 1'}, s:callbacks))
    endif
  endfunction

  command! CompileLatex call s:compile_latex()

  "function! s:reload_ctags()
  "    if expand('%:e') == 'rs'
  "        let fe =  system('ctags', '-R')
  "        if v:shell_error != 0
  "            echo fe
  "        endif
  "    else
  "        echo expand('%:e')
  "        echo 'Error: 拡張子が`rs`でないのでコンパイルできません.'
  "    endif
  "endfunction

  augroup FlowWriteFile
    au!
    autocmd BufWritePost *.tex :call s:compile_latex()
    "autocmd BufWritePost *.rs :call s:reload_ctags()
  augroup END
  " }}}
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

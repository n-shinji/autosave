" vim: set fenc=utf8 ff=unix ts=4 sts=4 sw=4 et nowrap ft=vim:
" AutoSave
" version 1.0

" if plugin is already loaded then, not load plugin.
if exists("g:loaded_autosave")
    finish
endif
let g:loaded_autosave = 1


if !exists('g:autosave')
    let g:autosave = 1
endif

"if !exists('g:autosave_exclude')
"    let g:autosave_exclude = []
"endif

let g:svbfre = '.\+'
set updatetime=250


command! AutoSaveToggle :call AutoSaveToggle()
autocmd CursorHold * call AutoSave()

" AutoSave enable/disable
function! AutoSaveToggle()
    if g:autosave >= 1
        let g:autosave = 0
        echo "Auto Save off"
    else
        let g:autosave = 1
        echo "Auto Save on"
    endif
endfunction

"let g:autosave_exclude = [ 'test', 'abc', 'vin', 'vimwiki' ]
"function! s:autoSaveDict()
"    if exists('g:autosave_exclude')
"        let g:autosave_exclude_list = {}
"        for m in g:autosave_exclude
"            let g:autosave_exclude_list[m] = 1
"        endfor
"    endif
"endfunction 
"call s:autoSaveDict()


" 除外する拡張子またはファイルタイプのチェック
" 拡張子とファイルタイプの判定別にするかは使ってみて判断
function! s:autoSaveCheck()
    let s:k1 = expand("%:e")
    let s:k2 = &ft
    if exists('g:autosave_exclude_list[s:k1]') || exists('g:autosave_exclude_list[s:k2]')
        return 0
    else 
        return 1
    endif
endfunction

" Auto Save
function! AutoSave()
    let s:check = s:autoSaveCheck()
    if s:check >= 1 && g:autosave >= 1
        if expand('%') =~ g:svbfre && !&readonly && &buftype == '' && isdirectory(expand('%:h'))
            silent update
        endif
    endif
endfunction




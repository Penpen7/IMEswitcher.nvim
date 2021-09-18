if exists('g:loaded_IMESwitcher')
    finish
endif

let g:loaded_IMESwitcher = 1
let g:IMESwitcher#normalModeInputSource="com.apple.keylayout.ABC"
let g:IMESwitcher#insertModeInputSource="com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese"
let s:cmd = expand('<sfile>:h:h:gs!\\!/!') . '/switcher/switcher' . (has('win32') ? '.exe' : '')

function! s:RequireIMESwitcher(host) abort
    return jobstart([s:cmd], {'rpc': v:true})
endfunction

function! s:checkExistsVariables() abort
  if !exists('g:is_IMESwitch_fix_mode')
    let g:is_IMESwitch_fix_mode = 0
  endif
endfunction

function! g:IMEFixModeToggle() abort
  call s:checkExistsVariables()
  if g:is_IMESwitch_fix_mode == 1
    let g:is_IMESwitch_fix_mode = 0
  else
    let g:is_IMESwitch_fix_mode = 1
  endif
endfunction


function! g:IMEswitcher#InsertLeave() abort
  call IMESwitch(g:IMESwitcher#normalModeInputSource)
endfunction

function! g:IMEswitcher#InsertEnter() abort
  if g:is_IMESwitch_fix_mode == 1
    call IMESwitch(g:IMESwitcher#insertModeInputSource)
  endif
endfunction



call s:checkExistsVariables()
call remote#host#Register('IMESwitcher', 'x', function('s:RequireIMESwitcher'))
call remote#host#RegisterPlugin('IMESwitcher', '0', [
    \ {'type': 'function', 'name': 'IMESwitch', 'sync': 1, 'opts': {}},
    \ ])

vim.cmd([[
augroup fix_yank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call system('C:/Windows/System32/clip.exe', @0) | endif
augroup END
]])
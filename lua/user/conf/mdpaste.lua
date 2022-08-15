vim.cmd([[
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'
" autocmd FileType markdown nnoremap <buffer><silent> <leader>of :!open -R <cfile><CR>
" nmap <buffer><silent> <leader>of :!open -R <cfile><CR>
]])

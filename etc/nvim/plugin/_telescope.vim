" gfiles shortcut
nnoremap <C-f> <cmd>Telescope find_files<cr>
nnoremap <C-g> <cmd>Telescope git_files<cr>

autocmd FileType TelescopePrompt call deoplete#custom#buffer_option('auto_complete', v:false)


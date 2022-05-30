local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- keep status bar position close to bottom
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  cursorcolumn = false,                    -- cursor column.
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- keep 8 height offset from above and bottom
  sidescrolloff = 8,                       -- keep 8 width offset from left and right
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  foldmethod = "expr",                     -- fold with nvim_treesitter
  foldexpr = "nvim_treesitter#foldexpr()",
  foldenable = false,                      -- no fold to be applied when open a file
  foldlevel = 99,                          -- if not set this, fold will be everywhere
  spell = false,                            -- add spell support
  spelllang = { 'en_us' },                 -- support which languages?
  diffopt="vertical,filler,internal,context:4",                      -- vertical diff split view
  cscopequickfix="s-,c-,d-,i-,t-,e-",       -- cscope output to quickfix window
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,]"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work


-- WSL yank support
vim.cmd [[
let s:clip = '/mnt/c/Windows/System32/clip.exe' 
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif
]]
vim.cmd("set relativenumber")

-- Run自动运行
vim.cmd([[
command! -nargs=* Run :call RunBuild(<f-args>)
func! RunBuild(...)
  exec "w"
  if &filetype == "arduino"
	  exec "w"
    if a:000[0] == 'uno'
      exec "!arduino-cli compile --fqbn arduino:avr:uno ../%<"
      exec "!arduino-cli upload -p $(find /dev//cu.usbmodem*) --fqbn arduino:avr:uno ../%<"
    elseif a:000[0] == 'nodemcu'
      exec "!arduino-cli compile --fqbn esp8266:esp8266:nodemcuv2 ../%<"
      exec "!arduino-cli upload -p $(find /dev//cu.wchusbserial*) --fqbn esp8266:esp8266:nodemcuv2 ../%<"
      endif

      elseif &filetype == "c"
        exec "!g++ -g *.c -o %<"
	let params=""
	for item in a:000
		let params=params.item." "
	endfor
        exec "!time ./%< ".params
      elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
      elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
      elseif &filetype == 'sh'
        exec ":!time bash %"
      elseif &filetype == 'python'
        silent! exec "!clear"
	let params=""
	for item in a:000
		let params=params.item." "
	endfor
        exec "ter python3 % ".params
      elseif &filetype == 'html'
        exec "!open %"
      elseif &filetype == 'markdown'
        exec "MarkdownPreview"
      elseif &filetype == 'vimwiki'
        exec "MarkdownPreview"
      endif
endfunc
]])

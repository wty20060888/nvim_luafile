local iron = require("iron.core")

--iron.set_config {
--  config = {
--    -- If iron should expose `<plug>(...)` mappings for the plugins
--    should_map_plug = false,
--    -- Whether a repl should be discarded or not
--    scratch_repl = true,
--    -- Your repl definitions come here
----    repl_definition = {
----      sh = {
----        command = {"zsh"}
----      }
----     }
--    repl_open_cmd ='below 15 split',
--    -- repl_open_cmd = require('iron.view').curry.bottom(15),
--    -- how the REPL window will be opened, the default is opening
--    -- a float window of height 40 at the bottom.
--  },
--  -- Iron doesn't set keymaps by default anymore. Set them here
--  -- or use `should_map_plug = true` and map from you vim files
--  keymaps = {
--    send_motion = "<space>sc",
--    visual_send = "<space>ss",
--    send_line = "<space>ss",
--    repeat_cmd = "<space>s.",
--    cr = "<space>s<cr>",
--    interrupt = "<space>s<space>",
--    exit = "<space>sq",
--    clear = "<space>cl",
--  }
--}


iron.setup {
  config = {
    -- If iron should expose `<plug>(...)` mappings for the plugins
    should_map_plug = false,
    -- Whether a repl should be discarded or not
    scratch_repl = true,
    -- Your repl definitions come here
    repl_definition = {
     python = {
        command = {"jupyter", "console"}
        --command = {"ipython", "--no-autoindent"}
      }
    },
    repl_open_cmd ='below 15 split',
    preferred = { python = "jupyter" },
    -- how the REPL window will be opened, the default is opening
    -- a float window of height 40 at the bottom.
  },

  -- Iron doesn't set keymaps by default anymore. Set them here
  -- or use `should_map_plug = true` and map from you vim files
  keymaps = {
    send_motion = "<space>sc",
    visual_send = "<space>sv",
    send_file = "<space>sf",
    send_line = "<space>s",
    send_mark = "<space>sm",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>si",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  }
}


--vim.cmd(
--[[
--vnoremap <leader>s <Esc>:call SendToTerminal()<CR>
--function! SendToTerminal()
--  let buff_n=term_list()
--  if len(buff_n)>0
--    let buff_n=buff_n[0]
--    let lines=getline(getpos("'<")[1],getpos("'>")[1])
--    let indent=match(lines[0],"    ")
--    for l in lines
--      let new_indent=match(lines[0],"    ")
--      if new_indent==0
--        call term_sendkeys(buff_n,l."\<CR>")
--      else
--        call term_sendkeys(buff_n,l[indent:]."\<CR>")
--      endif
--    endfor
--  endif
--endfunction
--]]
--)

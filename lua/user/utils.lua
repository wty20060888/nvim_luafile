local M = {}

M.SaveAndExit = function()
    -- wirte all buffer first
    vim.api.nvim_command(":wa")
    -- quit all buffer
    vim.api.nvim_command(":qa")
end


-- gtags
M.GtagsRefernce = function()
  local word = vim.api.nvim_call_function("expand", { "<cword>" })
  vim.api.nvim_command(":cs find c " .. word)
  vim.api.nvim_command(":copen")
end

M.GtagsText = function() 
  local word = vim.api.nvim_call_function("expand", { "<cword>" })
  vim.api.nvim_command(":cs find t " .. word)
  vim.api.nvim_command(":copen")
end

vim.api.nvim_create_user_command('ArduinoCompile',
  function(opts)
    vim.cmd([[!arduino-cli compile --fqbn arduino:avr:uno ../%<]])
  end,
  { nargs = "?" })

vim.api.nvim_create_user_command('ArduinoUpload',
  function(opts)
    vim.cmd([[!arduino-cli upload -p $(find /dev//cu.usbmodem*) --fqbn arduino:avr:uno ../%<]])
  end,
  { nargs = "?" })

vim.api.nvim_create_user_command('Picocom',
  function(opts)
    vim.cmd(string.format("TermExec cmd='picocom -b %d $(find /dev//cu.usbmodem*)'", opts.fargs[1]))
  end,
  { nargs = 1})

return M

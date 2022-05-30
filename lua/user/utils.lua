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

return M

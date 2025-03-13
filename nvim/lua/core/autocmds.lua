local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank
autocmd("TextYankPost", {
  group = augroup("highlight_yank"),
  callback = function()
    (vim.hl or vim.highlight).on_yank()
  end,
})

-- set formatoptions
autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.opt_local.formatoptions = "jcql"
  end,
})

-- enable wrap for specific filetypes
-- namely, tex and markdown
autocmd("FileType", {
  group = augroup("wrap"),
  pattern = { "text", "tex", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
  end,
})

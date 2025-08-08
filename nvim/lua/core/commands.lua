vim.api.nvim_create_user_command("GeneratePluginsDoc", function()
  require("core.utils").generate_plugins_list()
end, {})

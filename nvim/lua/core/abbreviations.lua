local map = require("core.utils").map

local function capitalize(string)
  return (string:gsub("^%l", string.upper))
end

-- NOTE: maybe it’s better to export only when espanso file is edited ?
-- so that no need to open the yaml file at every nvim opening

-- package.path = package.path
--   .. ";/Users/leo.guillon/.luarocks/share/lua/5.1/?.lua;/Users/leo.guillon/.luarocks/share/lua/5.1/?/init.lua"
-- package.cpath = package.cpath .. ";/Users/leo.guillon/.luarocks/lib/lua/5.1/?.so"
-- local lyaml = require("lyaml")
--
-- -- TODO: add env variable
-- local path = vim.fn.expand("~/dotfiles/espanso/match/expr.yml")
-- local file = io.open(path, "r")
-- local content = file:read("*all")
-- file:close()
--
-- local data = lyaml.load(content)
-- local matches = data.matches
--
-- for _, match in pairs(matches) do
--   map("ia", match.trigger, match.replace)
--   if match.propagate_case then
--     map("ia", capitalize(match.trigger), capitalize(match.replace))
--   end
-- end

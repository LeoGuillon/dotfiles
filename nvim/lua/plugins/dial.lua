return {
  "monaqa/dial.nvim",
  config = function()
    local dial = require("dial.config")
    local dial_map = require("dial.map")

    -- keymaps
    local map = vim.keymap.set

    -- stylua: ignore start
    map("n", "+", function() dial_map.manipulate("increment", "normal") end, { desc = "Increment under cursor" })
    map("n", "-", function() dial_map.manipulate("decrement", "normal") end, { desc = "Decrement under cursor" })
    map("n", "g+", function() dial_map.manipulate("increment", "gnormal") end, { desc = "Increment under cursor" })
    map("n", "g-", function() dial_map.manipulate("decrement", "gnormal") end, { desc = "Decrement under cursor" })
    map("v", "+", function() dial_map.manipulate("increment", "visual") end, { desc = "Increment under cursor" })
    map("v", "-", function() dial_map.manipulate("decrement", "visual") end, { desc = "Decrement under cursor" })
    map("v", "g+", function() dial_map.manipulate("increment", "gvisual") end, { desc = "Increment under cursor" })
    map("v", "g-", function() dial_map.manipulate("decrement", "gvisual") end, { desc = "Decrement under cursor" })
    -- stylua: ignore end

    -- ────────────────────────────────────────────────────────────────────────────────
    -- (CUSTOM AUGENDS)

    local augend = require("dial.augend")

    -- TODO: setup custom augends for specific languages, notably lua, latex and R

    local logical_door = augend.constant.new({
      elements = { "&&", "||" },
      word = false,
      cyclic = true,
    })

    local capitalized_boolean = augend.constant.new({
      elements = {
        "True",
        "False",
      },
      word = true,
      cyclic = true,
    })

    local caps_boolean = augend.constant.new({
      elements = {
        "TRUE",
        "FALSE",
      },
      word = true,
      cyclic = true,
    })

    local interval_limits = augend.constant.new({
      elements = {
        "]",
        "[",
      },
      word = false,
      cyclic = true,
    })

    dial.augends:register_group({
      -- default augends used when no group name is specified
      default = {
        augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, …)
        augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
        augend.date.alias["%d/%m/%Y"], -- date in classic format (18/04/1998, etc.)
        augend.date.alias["%Y-%m-%d"], -- date in iso format (1998-04-18, etc.)
        augend.constant.alias.bool, -- boolean value (true <-> false)
        capitalized_boolean,
        caps_boolean,
        logical_door,
        interval_limits,
        augend.constant.alias.alpha, -- lowercase alphabet (a, b, c, …)
        augend.constant.alias.Alpha, -- uppercase alphabet (A, B, C, …)
      },
    })
  end,
}

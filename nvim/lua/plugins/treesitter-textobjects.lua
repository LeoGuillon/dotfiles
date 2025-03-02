return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true, -- only loads when needed as a dependancy
  config = function()
    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- allows to look forward for text-objects

          keymaps = {

            -- [e]quals
            ["ae"] = { query = "@assignment.outer", desc = "outer part of an assignment" },
            ["ie"] = { query = "@assignment.inner", desc = "inner part of an assignment" },
            ["le"] = { query = "@assignment.lhs", desc = "left hand side of an assignment" },
            ["re"] = { query = "@assignment.rhs", desc = "right hand side of an assignment" },

            -- coding text [o]bjects

            -- [i]f else
            ["aoi"] = { query = "@conditional.outer", desc = "outer part of a conditional" },
            ["ioi"] = { query = "@conditional.inner", desc = "inner part of a conditional" },

            -- [l]oop
            ["aol"] = { query = "@loop.outer", desc = "outer part of a loop" },
            ["iol"] = { query = "@loop.inner", desc = "inner part of a loop" },

            -- [f]unction call
            ["aof"] = { query = "@call.outer", desc = "outer part of a function call" },
            ["iof"] = { query = "@call.inner", desc = "inner part of a function call" },

            -- function or class [d]efinition
            ["aod"] = { query = "@call.outer", desc = "outer part of a function definition" },
            ["iod"] = { query = "@call.inner", desc = "inner part of a function definition" },
          }

        }
      }
    })
  end
}

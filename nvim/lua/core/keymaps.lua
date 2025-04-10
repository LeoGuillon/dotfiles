-- TODO: define a custom map function to always define silent and noremap as true
local map = vim.keymap.set

-- ——————————————————————————————————————————————————————————————————————————————
-- (LEADER KEY)
-- ——————————————————————————————————————————————————————————————————————————————

map({ "n", "v" }, "<Space>", "<Nop>")

vim.g.mapleader = " "
vim.g.maplocalleader = "_" -- not a high user of the og _ key

-- ——————————————————————————————————————————————————————————————————————————————
-- (COMMON SHORTCUTS)
-- ——————————————————————————————————————————————————————————————————————————————
-- let's put some common keyboard shortcuts to spare some command mode

map({ "i", "c" }, "<A-BS>", "<C-w>") -- map opt+backspace in insert and command modes

-- TODO: figure out how to use cmd key in wezterm
-- map("i", "<D-BS>", '<Esc>"_cc')
-- map("n", "<D-s>", "<cmd>w<cr>", { desc = "Save current buffer" })
-- map("i", "<D-s>", "<esc><cmd>w<cr>a", { desc = "Save current buffer" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (BETTER ESCAPE)
-- ——————————————————————————————————————————————————————————————————————————————
-- credits : https://nanotipsforvim.prose.sh/esc-in-normal-mode

map("n", "<esc>", "<cmd>nohl<cr><cmd>echo<cr>", { desc = "Escape and clear hlsearch and command line" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (EDITION)
-- ——————————————————————————————————————————————————————————————————————————————

-- ——————————————————————————————————————————————————————————————————————————————
-- (YANKING AND PASTING)

-- deleting and changing to the black hole register
-- credits : https://nanotipsforvim.prose.sh/keeping-your-register-clean-from-dd
map({ "n", "v" }, "x", '"_x', { desc = "Delete under cursor" })
map({ "n", "v" }, "c", '"_c', { desc = "Change" })
map({ "n", "v" }, "C", '"_C', { desc = "Change until the end of line" })
map("n", "s", '"_cl', { desc = "Substitute character" })
map("n", "S", '"_cc', { desc = "Substitute line" })
map("n", "dd", function()
  if vim.fn.getline(".") == "" then
    return '"_dd'
  end
  return "dd"
end, { expr = true, desc = "Delete line" }) -- Add moves it to the black hole only if it's empty

-- yank by keeping the cursor at the same position
-- credits : https://nanotipsforvim.prose.sh/sticky-yank
do
  local cursorPreYank
  vim.keymap.set({ "n", "x" }, "y", function()
    cursorPreYank = vim.api.nvim_win_get_cursor(0)
    return "y"
  end, { desc = "Yank", expr = true })
  vim.keymap.set("n", "Y", function()
    cursorPreYank = vim.api.nvim_win_get_cursor(0)
    return "y$" -- TODO: transform to "yg$" ?
  end, { desc = "Yank to the end of line", expr = true })
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      if vim.v.event.operator == "y" and cursorPreYank then
        vim.api.nvim_win_set_cursor(0, cursorPreYank)
      end
    end,
  })
end

-- Maj operators
map("n", "P", "mz$p`z", { desc = "Paste at the end of line" })
map("n", "X", function()
  local updatedLine = vim.api.nvim_get_current_line():gsub("%S%s*$", "")
  vim.api.nvim_set_current_line(updatedLine)
end, { desc = "Delete char" })

map("v", "p", "P", { desc = "Paste" }) -- to avoid recording when yanking and pasting over a selection and keeps the yanked in register

-- ——————————————————————————————————————————————————————————————————————————————
-- (UNDO/REDO)

map({ "n", "v" }, "U", "<C-r>", { desc = "Redo" }) -- more consistent undo keymap

-- more molecular checkpoints during editing
local undo_checkpoints_chars = {
  ";",
  ".",
  "!",
  "?",
  ":",
}
for _, key in pairs(undo_checkpoints_chars) do
  map("i", key, ("%s<c-g>u"):format(key))
end
-- ——————————————————————————————————————————————————————————————————————————————
-- (MOVING CHARACTERS)

map("n", "<A-Left>", '"zdh"zph', { desc = "move character Left" })
map("n", "<A-Right>", '"zx"zp', { desc = "move character Right" })
-- TODO: add the same moves in visual mode

-- ——————————————————————————————————————————————————————————————————————————————
-- (MOVING LINES)

map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "move line Down" })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "move line Up" })
map("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "move lines Down" })
map("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "move lines Up" })

-- same but with shift for 6 lines up/down
map("n", "<S-A-Down>", "<cmd>execute 'move .+' . (v:count1 + 5)<cr>==", { desc = "move line Down x6" }) -- don’t know why 5 to have 6 lines up, but it works
map("n", "<S-A-Up>", "<cmd>execute 'move .-' . (v:count1 + 6)<cr>==", { desc = "move line Up x6" })
map("v", "<S-A-Down>", ":<C-u>execute \"'<,'>move '>+\" . (v:count1 + 5)<cr>gv=gv", { desc = "move lines Down x6" })
map("v", "<S-A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 6)<cr>gv=gv", { desc = "move lines Up x6" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (CASING)

map("n", "~", "v~", { desc = "Togglecase a single character" }) -- without moving forward

-- credits : https://nanotipsforvim.prose.sh/quickly-toggle-casing
map("n", "<leader>~", "mzlblgueh~`z", { desc = "Smart word togglecasing" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (COMMENTING)

-- handled in Comment.nvim plugin
-- map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add comment below" })
-- map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add comment above" })
-- map("n", "gca", "o<esc>Vcz<esc><cmd>normal gcc<cr>kJfza<bs>", { desc = "Add comment at the end of line" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (NEW LINES)

map("n", "gn", "mzo<esc>^D`z", { desc = "Add an empty line below" })
map("n", "gN", "mzO<esc>^D`z", { desc = "Add an empty line above" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (TRAILING CHARS)
-- credits : https://github.com/chrisgrieser/.config/blob/9fb7bea009be951f9676ef52634a7d12d9717953/nvim/lua/config/leader-keybindings.lua

local trail_chars = {
  ",",
  ";",
  ".",
}
for _, key in pairs(trail_chars) do
  map("n", "<leader>" .. key, ("mzA%s<Esc>`z"):format(key), { desc = ("add %s to eol"):format(key) })
end

-- ——————————————————————————————————————————————————————————————————————————————
-- (INDENTATION)

-- same command as in insert mode for more consistency
map("n", "<Tab>", ">>", { desc = "󰉶 indent" })
map("x", "<Tab>", ">gv", { desc = "󰉶 indent" })
map("n", "<S-Tab>", "<<", { desc = "󰉵 outdent" })
map("x", "<S-Tab>", "<gv", { desc = "󰉵 outdent" })

map("n", "=", "mzgg=G`z", { desc = "correct the indent for whole buffer" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (ERGO-L LAYOUT SPECIFIC KEYMAPS)
-- ——————————————————————————————————————————————————————————————————————————————
-- credits : https://ergol.org/articles/vim_pour_les_ergonautes/

map("n", ",", ";", { desc = "Go to next occurence in line" })
map("n", ";", ",", { desc = "Go to previous occurence in line" })

map("n", "<C-c>", "<C-i>", { desc = "Jump to previous location" }) -- so that they're next to each other

-- ——————————————————————————————————————————————————————————————————————————————
-- PERSONAL IMPROVEMENTS

-- +/- on increment/decrement
-- NOTE: this is handled by dial.nvim, so that's a backup
map({ "n", "v" }, "+", "<C-a>", { desc = "Increment" })
map({ "n", "v" }, "-", "<C-x>", { desc = "Decrement" })
map({ "n", "v" }, "g+", "<C-a>", { desc = "g-Increment" })
map({ "n", "v" }, "g-", "<C-x>", { desc = "g-Decrement" })

-- remapping of hjkl to other functions
-- as regular arrow movements are mapped to the arrow keys, to another layer
-- [j]oin lines
map("n", "j", "J", { desc = "Join next line to the current" })
map("n", "gj", "gJ", { desc = "Join next line to the current (without blank space)" })
map("n", "J", "kJ", { desc = "Join current line to the previous" })
map("n", "gJ", "kgJ", { desc = "Join current line to the previous (without blank space)" })

-- [k]nit lines
-- opposite functions to j/J
-- TODO: use plugin revJ to better handle this operation
map("n", "k", "i<CR><Esc>", { desc = "Unjoin to the next line" })

map("n", "\\", "?", { desc = "Search backwards" }) -- due to the symmetry between \ and / on symbol layer

-- makes the command mode a bit more accessible
-- NOTE: disabled, to make more use of marks,
-- and use more thoughtfully the command mode, notably by using more efficient
-- keymaps for saving and quitting
-- map({ "n", "v" }, "'", ":", { desc = "Command line" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (VISUAL MODE)
-- ——————————————————————————————————————————————————————————————————————————————

map("v", "v", "<C-v>", { desc = "Visual block mode" }) -- double tap v to enter visual block mode
map("v", "V", "j", { desc = "Select next line" })

map("v", "<", "<gv", { desc = "Indent selection to the left" })
map("v", ">", ">gv", { desc = "Indent selection to the right" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (INSERT MODE)
-- ——————————————————————————————————————————————————————————————————————————————

-- insert mode that respect indentation
-- credits : https://github.com/chrisgrieser/.config/blob/main/nvim/lua/config/keybindings.lua
map("n", "i", function()
  local lineEmpty = vim.trim(vim.api.nvim_get_current_line()) == ""
  return lineEmpty and [["_cc]] or "i"
end, { expr = true, desc = "Insert mode" })
map("n", "a", function()
  local lineEmpty = vim.trim(vim.api.nvim_get_current_line()) == ""
  return lineEmpty and [["_cc]] or "a"
end, { expr = true, desc = "insert mode, Append" })

-- navigation similar to macos usual settings
-- opt + left/right = move backward/forward one word
map("i", "<A-Left>", "<S-Left>")
map("i", "<A-Right>", "<S-Right>")

-- cmd
map("i", "<D-Left>", "<Home>")
map("i", "<D-Right>", "<End>")
map("i", "<D-Up>", "<C-Home>")
map("i", "<D-Down>", "<C-End>")

-- ────────────────────────────────────────────────────────────────────────────────
-- (COMMAND MODE)
-- ────────────────────────────────────────────────────────────────────────────────

map("n", "ZA", "<CMD>wqa<CR>", { desc = "save and quit all buffers" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (NAVIGATION)
-- ——————————————————————————————————————————————————————————————————————————————

-- better up/down
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Faster navigation
-- credits : https://nanotipsforvim.prose.sh/motion-setup--hjkl-as-amplified-hjkl
-- TODO: correct with gj, gk etc for normal mode
map({ "n", "v" }, "<S-Left>", "^", { desc = "Go to first non-blank character", silent = true })
map({ "n", "v" }, "<S-Down>", "6j", { desc = "Move down 6 lines", silent = true })
map({ "n", "v" }, "<S-Up>", "6k", { desc = "Move up 6 lines", silent = true })
map({ "n", "v" }, "<S-Right>", "$", { desc = "Go to end of line", silent = true })

-- Window navigation
map("n", "<C-Left>", "<C-w>h", { desc = "Go to Left Window", silent = true, remap = true })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to Lower Window", silent = true, remap = true })
map("n", "<C-Up>", "<C-w>k", { desc = "Go to Upper Window", silent = true, remap = true })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Window", silent = true, remap = true })

-- next and previous occurences by maintaining the cursor centered
map("n", "n", "nzzzv", { desc = "Next occurence of search" })
map("n", "N", "Nzzzv", { desc = "Previous occurence of search" })

-- pages up/down keeps the cursor centered
map({ "n", "v" }, "<PageDown>", "<c-d>zz", { desc = "half-page Down" })
map({ "n", "v" }, "<PageUp>", "<c-u>zz", { desc = "half-page Up" })
map({ "n", "v" }, "<S-PageDown>", "<c-f>zz", { desc = "page down (Forwards)" })
map({ "n", "v" }, "<S-PageUp>", "<c-b>zz", { desc = "page up (Backwards)" })

-- [g]o to [m]atching parenthesis
map({ "n", "v" }, "gm", "%", { desc = "Go to Matching bracket" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (BUFFERS)

map("n", "<C-Tab>", "<cmd>bnext<cr>", { desc = "go to next buffer" })
map("n", "<C-S-Tab>", "<cmd>bprevious<cr>", { desc = "go to previous buffer" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (TEXT OBJECTS)
-- ——————————————————————————————————————————————————————————————————————————————

-- remapped text objects
-- credits : https://nanotipsforvim.prose.sh/remapping-all-your-textobjs-for-speed
-- reminder : already existing text objects :
-- [l]etter (e.g. character)
-- [w]ord
-- [s]entence
-- [p]aragraph
-- [t]ag
-- [b]rackets

-- [c]urly brace
map({ "v", "o" }, "ic", "i}", { desc = "inner {}" })
map({ "v", "o" }, "ac", "a}", { desc = "outer {}" })

-- [r]ectangular bracket
map({ "v", "o" }, "ir", "i]", { desc = "inner []" })
map({ "v", "o" }, "ar", "a]", { desc = "outer []" })

-- che[v]rons
map({ "v", "o" }, "iv", "i>", { desc = "inner <>" })
map({ "v", "o" }, "av", "a>", { desc = "outer <>" })

-- [q]uoted text
map({ "v", "o" }, "iq", 'i"', { desc = 'inner "' })
map({ "v", "o" }, "aq", 'a"', { desc = 'outer "' })

-- [a]postrothe quoted text
map({ "v", "o" }, "ia", "i'", { desc = "inner '" })
map({ "v", "o" }, "aa", "a'", { desc = "outer '" })

-- [i]nline code
map({ "v", "o" }, "ii", "i`", { desc = "inner `" })
map({ "v", "o" }, "ai", "a`", { desc = "outer `" })

-- NOTE: treesitter’s text objects memo :
-- all of them starts with [o]

-- NOTE: vimtex's text objects memo :
-- [l]aTeX command
-- [d]elimiters
-- [e]nvironnement
-- [m]ath block
-- [s]ection
--   (conflict with the base [s]entence textobject, but I don't use it very often anyways)

-- ——————————————————————————————————————————————————————————————————————————————
-- (LEADER MAPPINGS)
-- ——————————————————————————————————————————————————————————————————————————————

-- [U]I toggles
map("n", "<leader>ul", "<cmd>Lazy<cr>", { desc = "open Lazy" })
map("n", "<leader>un", "<cmd>set number!<cr><cmd>set relativenumber!<cr>", { desc = "toggle line Numbers" })
map("n", "<leader>uw", "<cmd>set wrap!<cr>", { desc = "toggle line Wrap" })

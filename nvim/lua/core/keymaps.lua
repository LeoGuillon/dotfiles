local map = require("core.utils").map

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

-- cmd/ctrl+S = save file
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save current buffer" })
map("i", "<C-s>", "<esc><cmd>w<cr>a", { desc = "Save current buffer" })
map("v", "<C-s>", "<esc><cmd>w<cr>gv", { desc = "Save current buffer" })

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
  map({ "n", "x" }, "y", function()
    cursorPreYank = vim.api.nvim_win_get_cursor(0)
    return "y"
  end, { desc = "Yank", expr = true })
  map("n", "Y", function()
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
-- (NEW LINES)

-- -- NOTE: to avoid conflict with `gn` in obsidian, which does the `gf`/`gx` action
-- map("n", "gn", "mzo<esc>^D`z", { desc = "Add an empty line below" })
-- map("n", "gN", "mzO<esc>^D`z", { desc = "Add an empty line above" })

map("n", "<CR>", "mzo<esc>^D`z", { desc = "Add an empty line below" })
map("n", "<S-CR>", "mzO<esc>^D`z", { desc = "Add an empty line above" })
-- TODO: test the <S-CR> combo on wezterm

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

-- [h]op : see flash plugin

-- [j]oin lines
map("n", "j", "J", { desc = "Join next line to the current" })
map("n", "gj", "gJ", { desc = "Join next line to the current (without blank space)" })
map("n", "J", "kJ", { desc = "Join current line to the previous" })
map("n", "gJ", "kgJ", { desc = "Join current line to the previous (without blank space)" })

-- [k]nit lines
-- opposite functions to j/J
-- TODO: use plugin revJ to better handle this operation
map("n", "k", "i<CR><Esc>", { desc = "Unjoin to the next line" })

-- [l]ean back : just a shortcut for ge/gE
-- map({ "n", "x", "o" }, "l", "ge", { desc = "go to previous end (Lean back)" })
-- map({ "n", "x", "o" }, "L", "gE", { desc = "go to previous END (Lean back)" })
-- NOTE: better version with nvim-spider

map("n", "\\", "?", { desc = "Search backwards" }) -- due to the symmetry between \ and / on symbol layer

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
-- (AUTOFILLS)

-- similar espanso autofills, to avoid colliding with normal mode commands

map("i", "qe", "que", { desc = "qe autofill" })
map("i", "qi", "qui", { desc = "qi autofill" })
map("i", "qo", "quo", { desc = "qo autofill" })

-- ────────────────────────────────────────────────────────────────────────────────
-- (COMMAND MODE)
-- ────────────────────────────────────────────────────────────────────────────────

map("n", "ZZ", "<CMD>wq<CR>", { desc = "save and quit current buffer" })
map("n", "ZA", "<CMD>wqa<CR>", { desc = "save and quit all buffers" })
map("n", "ZQ", "<CMD>q!<CR>", { desc = "quit current buffer without saving" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (NAVIGATION)
-- ——————————————————————————————————————————————————————————————————————————————

-- ────────────────────────────────────────────────────────────────────────────────
-- (INTRA-PANE)

-- better up/down
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true })

map("n", "^", "0^", { desc = "Go to the first non-blank character" })
-- so that it puts backs the visual at the gutter, in case you’re in a long line

-- Faster navigation
-- credits : https://nanotipsforvim.prose.sh/motion-setup--hjkl-as-amplified-hjkl
map({ "n", "v" }, "<S-Left>", "0^", { desc = "Go to first non-blank character" })
map("n", "<S-Down>", "6gj", { desc = "Move down 6 lines" })
map("v", "<S-Down>", "6j", { desc = "Move down 6 lines" })
map("n", "<S-Up>", "6gk", { desc = "Move down 6 lines" })
map("v", "<S-Up>", "6k", { desc = "Move down 6 lines" })
map({ "n", "v" }, "<S-Right>", "$", { desc = "Go to end of line" })

-- pages up/down keeps the cursor centered
map({ "n", "v" }, "<PageDown>", "<c-d>zz", { desc = "half-page Down" })
map({ "n", "v" }, "<PageUp>", "<c-u>zz", { desc = "half-page Up" })
map({ "n", "v" }, "<S-PageDown>", "<c-f>zz", { desc = "page down (Forwards)" })
map({ "n", "v" }, "<S-PageUp>", "<c-b>zz", { desc = "page up (Backwards)" })

-- next and previous occurences by maintaining the cursor centered
map("n", "n", "nzzzv", { desc = "Next occurence of search" })
map("n", "N", "Nzzzv", { desc = "Previous occurence of search" })

-- ────────────────────────────────────────────────────────────────────────────────
-- (INTER-PANE)

-- Pane creation
map("n", "<C-h>", "<C-w>v", { desc = "Split horizontally" })
map("n", "<C-v>", "<C-w>s", { desc = "Split vertically" })

-- Pane navigation
map("n", "<C-Left>", "<C-w>h", { desc = "Go to Left Window" })
map("n", "<C-Down>", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "<C-Up>", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "<C-Right>", "<C-w>l", { desc = "Go to Right Window" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (BUFFERS)

map("n", "<C-TAB>", "<cmd>bnext<cr>", { desc = "go to next buffer" })
map("n", "<C-S-TAB>", "<cmd>bprevious<cr>", { desc = "go to previous buffer" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (TEXT OBJECTS)
-- ——————————————————————————————————————————————————————————————————————————————

-- remapped text objects
-- credits : https://nanotipsforvim.prose.sh/remapping-all-your-textobjs-for-speed
-- reminder : already existing text objects :
-- [w]ord / [W]ord
-- [s]entence
-- [p]aragraph
-- [t]ag
-- [b]rackets

-- [c]urly brace
map({ "x", "o" }, "ic", "i}", { desc = "{} (Curly braces)" })
map({ "x", "o" }, "ac", "a}", { desc = "{} (Curly braces)" })

-- [r]ectangular bracket
map({ "x", "o" }, "ir", "i]", { desc = "[] (Rectangular brackets)" })
map({ "x", "o" }, "ar", "a]", { desc = "[] (Rectangular brackets)" })

-- che[v]rons
map({ "x", "o" }, "iv", "i>", { desc = "<> (cheVrons)" })
map({ "x", "o" }, "av", "a>", { desc = "<> (cheVrons)" })

-- [q]uoted text
map({ "x", "o" }, "iq", 'i"', { desc = '" (Quoted text)' })
map({ "x", "o" }, "aq", 'a"', { desc = '" (Quoted text)' })

-- [a]postrothe quoted text
map({ "x", "o" }, "ia", "i'", { desc = "' (Apostrophe)" })
map({ "x", "o" }, "aa", "a'", { desc = "' (Apostrophe)" })

-- [i]nline code
map({ "x", "o" }, "ii", "i`", { desc = "` (Inline code)" })
map({ "x", "o" }, "ai", "a`", { desc = "` (Inline code)" })

-- NOTE: treesitter’s text objects memo :
-- all of them starts with [o]

-- NOTE: vimtex's text objects memo :
-- [d]elimiters
-- [e]nvironnement
-- [l]aTeX command
-- [m]ath block
-- se[x]ion

-- ────────────────────────────────────────────────────────────────────────────────
-- (MACROS)
-- ────────────────────────────────────────────────────────────────────────────────

-- new behaviour for macros, as I usually use only one at the same time :
-- press qq to record, q to stop recording, then Q to apply

map("n", "Q", "@q", { desc = "Apply recorded macro" })
map("v", "Q", "<cmd>norm @q<cr>", { desc = "Apply recorded macro to visual selection" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (LEADER MAPPINGS)
-- ——————————————————————————————————————————————————————————————————————————————

-- [U]I toggles
map("n", "<leader>ol", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>tn", "<cmd>set number!<cr><cmd>set relativenumber!<cr>", { desc = "toggle line Numbers" })
map("n", "<leader>tw", "<cmd>set wrap!<cr>", { desc = "toggle line Wrap" })

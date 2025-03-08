vim.g.mapleader = " "

local map = vim.keymap.set

-- ——————————————————————————————————————————————————————————————————————————————
-- (BETTER ESCAPE)
-- ——————————————————————————————————————————————————————————————————————————————
-- credits : https://nanotipsforvim.prose.sh/esc-in-normal-mode

map("n", "<esc>", "<cmd>nohl<cr>", { desc = "Escape and clear hlsearch" })

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
map("n", "dd", function()
  if vim.fn.getline(".") == "" then
    return '"_dd'
  end
  return "dd"
end, { expr = true, desc = "Delete line" }) -- Add moves it to the black hole only if it's empty

map("n", "Y", "yg$", { desc = "Yank from cursor to the end of line" })
map("n", "P", "mz$p`z", { desc = "Paste at the end of line" })

map({ "n", "v" }, "U", "<C-r>", { desc = "Redo" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (MOVING LINES)

map("n", "<A-Down>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-Up>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-Down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-Up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-Down>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-Up>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

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
-- (NEW LINES)
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
-- (ERGO-L LAYOUT SPECIFIC KEYMAPS)
-- ——————————————————————————————————————————————————————————————————————————————
-- credits : https://ergol.org/articles/vim_pour_les_ergonautes/

map("n", ",", ";", { desc = "Go to next occurence in line" })
map("n", ";", ",", { desc = "Go to previous occurence in line" })

map("n", "<C-c>", "<C-i>", { desc = "Jump to previous location" }) -- so that they're next to each other

map({ "n", "v" }, "+", "<C-a>", { desc = "Increment" })
map({ "n", "v" }, "-", "<C-x>", { desc = "Decrement" })
map({ "n", "v" }, "g+", "<C-a>", { desc = "g-Increment" })
map({ "n", "v" }, "g-", "<C-x>", { desc = "g-Decrement" })

-- ——————————————————————————————————————————————————————————————————————————————
-- PERSONAL IMPROVEMENTS

-- remapping of hjkl to other functions
-- as regular arrow movements are mapped to the arrow keys, to another layer
-- [j]oin lines
map("n", "j", "J", { desc = "Join next line to the current" })
map("n", "J", "kJ", { desc = "Join current line to the previous" })

-- [k]nit lines
-- opposite functions to j/J
map("n", "k", "i<CR><Esc>", { desc = "Unjoin to the next line" })

map("n", "\\", "?", { desc = "Search backwards" }) -- due to the symmetry between \ and / on symbol layer

map("n", "'", ":", { desc = "Command line" }) -- makes it a bit more accessible

-- ——————————————————————————————————————————————————————————————————————————————
-- (VISUAL MODE)
-- ——————————————————————————————————————————————————————————————————————————————

map("v", "v", "<C-v>", { desc = "Visual block mode" }) -- double tap v to enter visual block mode
map("v", "V", "j", { desc = "Select next line" })

map("v", "<", "<gv", { desc = "Indent selection to the left" })
map("v", ">", ">gv", { desc = "Indent selection to the right" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (NAVIGATION)
-- ——————————————————————————————————————————————————————————————————————————————

-- better up/down
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Faster navigation
-- credits : https://nanotipsforvim.prose.sh/motion-setup--hjkl-as-amplified-hjkl
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

-- ——————————————————————————————————————————————————————————————————————————————
-- (TEXT OBJECTS)
-- ——————————————————————————————————————————————————————————————————————————————

-- remapped text objects
-- credits : https://nanotipsforvim.prose.sh/remapping-all-your-textobjs-for-speed

-- [c]urly brace
map({ "v", "o" }, "ic", "i}", { desc = "inner {}" })
map({ "v", "o" }, "ac", "a}", { desc = "outer {}" })

-- [r]ectangular bracket
map({ "v", "o" }, "ir", "i]", { desc = "inner []" })
map({ "v", "o" }, "ar", "a]", { desc = "outer []" })

-- che[v]rons
map({ "v", "o" }, "iv", "i>", { desc = "inner <>" })
map({ "v", "o" }, "av", "a>", { desc = "outer <>" })

-- [m]assive word
map({ "v", "o" }, "im", "iW", { desc = "inner WORD" })
map({ "v", "o" }, "am", "aW", { desc = "outer WORD" })

-- [q]uoted text
map({ "v", "o" }, "iq", 'i"', { desc = 'inner "' })
map({ "v", "o" }, "aq", 'a"', { desc = 'outer "' })

-- [a]postrothe quoted text
map({ "v", "o" }, "ia", "a'", { desc = "inner '" })
map({ "v", "o" }, "aa", "a'", { desc = "outer '" })

-- [i]nline code
map({ "v", "o" }, "ii", "i`", { desc = "inner `" })
map({ "v", "o" }, "ai", "a`", { desc = "outer `" })

-- ——————————————————————————————————————————————————————————————————————————————
-- (LEADER MAPPINGS)
-- ——————————————————————————————————————————————————————————————————————————————

-- Lazy UI opening
map("n", "<leader>ul", "<cmd>Lazy<cr>", { desc = "Open Lazy" })

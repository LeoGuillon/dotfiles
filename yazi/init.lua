require("full-border"):setup()

require("starship"):setup({
  -- Hide flags (such as filter, find and search). This is recommended for starship themes which
  -- are intended to go across the entire width of the terminal.
  hide_flags = true, -- Default: false
  -- Whether to place flags after the starship prompt. False means the flags will be placed before the prompt.
  flags_after_prompt = false, -- Default: true
  -- Custom starship configuration file to use
  -- config_file = "~/.config/starship_full.toml", -- Default: nil
})

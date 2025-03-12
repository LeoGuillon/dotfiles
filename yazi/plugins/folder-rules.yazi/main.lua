return {
  setup = function()
    ps.sub("cd", function()
      local cwd = cx.active.current.cwd
      -- we sort the Downloads folder by reverse modification time
      if cwd:ends_with("Downloads") then
        ya.mgr_emit("sort", { "mtime", reverse = true, dir_first = false })
      else
        ya.mgr_emit("sort", { "alphabetical", reverse = false, dir_first = true })
      end
    end)
  end,
}

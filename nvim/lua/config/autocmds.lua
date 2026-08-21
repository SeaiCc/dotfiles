vim.api.nvim_create_user_command("PackStatus", function (opts)
  local targets = #opts.fargs > 0 and opts.frags or nil
  vim.pack.update(targets, { offline = true })
end, {
  nargs = "*",
  complete = get_plugin_names,
  desc = "Check plugin status without downloading",
})

vim.api.nvim_create_user_command("PackRemove", function (opts)
  if #opts.fargs == 0 then
    vim.notify("At least one plugin to remove.", vim.log.levels.WARN)
    return
  end
  local targets = opts.fargs
  vim.pack.del(targets, { offline = true })
end, {
  nargs = "+",
  complete = get_plugin_names,
  desc = "Delete plugin."
})


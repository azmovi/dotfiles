---@type vim.lsp.Config
return {
  settings = {
    cucumber = {
      features = { "**/features/**/*.feature" },
      glue = { "**/features/steps/**/*.py" },
    },
  },
}

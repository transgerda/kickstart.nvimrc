return {
  'Mofiqul/vscode.nvim', -- GitHub repo URL
  config = function()
    -- Configuration options for vscode.nvim
    require('vscode').setup {
      -- Customize the plugin if needed
      -- Example: use a custom color scheme
      -- colorscheme = "vscode",
      -- you can add other options here
    }
  end,
}

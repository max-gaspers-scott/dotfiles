return {
  -- Rustaceanvim will handle rust-analyzer configuration
  -- LSP support for Rust is handled by rustaceanvim
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended by LazyVim
    lazy = false, -- This plugin is already lazy-loaded by filetype
    opts = {
      server = {
        default_settings = {
          ["rust-analyzer"] = {
            cargo = {
              extraArgs = { "--jobs", "2" }, -- Limits background thread usage
            },
            checkOnSave = {
              extraArgs = { "--jobs", "2" }, -- Limits threads used during cargo check
            },
          },
        },
      },
    },
  },
}

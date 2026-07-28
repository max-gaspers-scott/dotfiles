-- ~/.config/nvim/lua/plugins/rust.lua
return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false, -- Already lazy-loaded by filetype
    config = function()
      vim.g.rustaceanvim = {
        server = {
          default_settings = {
            ["rust-analyzer"] = {
              cargo = {
                extraArgs = { "--jobs", "2" },
              },
              checkOnSave = {
                extraArgs = { "--jobs", "2" },
              },
            },
          },
        },
      }
    end,
  },
}

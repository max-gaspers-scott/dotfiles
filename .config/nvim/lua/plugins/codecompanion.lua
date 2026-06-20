return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      goose = function()
        return require("codecompanion.adapters").extend("goose", {})
      end,
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "cmd:echo $GEMINI_API_KEY",
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "goose",
      },
      inline = {
        adapter = "gemini",
      },
      cmd = {
        adapter = "gemini",
      },
    },
  },
  keys = {
    { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", desc = "AI Chat" },
    { "<leader>a", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI Actions" },
  },
}

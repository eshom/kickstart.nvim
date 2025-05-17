return {
  'folke/flash.nvim',
  event = 'VeryLazy',
  ---@type Flash.Config
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    highlight = {
      backdrop = false,
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>fs", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "[F]lash" },
    { "<leader>ft", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "[F]lash [T]reesitter" },
    { "<leader>fr", mode = "o", function() require("flash").remote() end, desc = "[R]emote Flash" },
    { "<leader>fT", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "[T]reesitter Search" },
    { "<c-/>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}

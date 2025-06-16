return {
  {
    "tris203/precognition.nvim",
    opts = {
      startVisible = true, -- Change to true if you want it enabled by default
    },
    keys = {
      {
        "<leader>uP",
        function()
          if require("precognition").toggle() then
            vim.notify("Precognition is on")
          else
            vim.notify("Precognition is off")
          end
        end,
        desc = "Toggle Precognition",
      },
    },
  },
}

return {}
-- return {
--   "supermaven-inc/supermaven-nvim",
--   event = "InsertEnter",
--   cmd = {
--     "SupermavenUsePro",
--   },
--   opts = {
--     keymaps = {
--       accept_suggestion = nil, -- handled by nvim-cmp or blink
--     },
--     disable_inline_completion = vim.g.ai_cmp,
--     auto_trigger = true, -- auto-suggest as you type/pause
--     ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
--   },
-- }
--     Full Spec
--
-- {
--   "supermaven-inc/supermaven-nvim",
--   event = "InsertEnter",
--   cmd = {
--     "SupermavenUseFree",
--     "SupermavenUsePro",
--   },
--   opts = {
--     keymaps = {
--       accept_suggestion = nil, -- handled by nvim-cmp / blink.cmp
--     },
--     disable_inline_completion = vim.g.ai_cmp,
--     ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
--   },
-- }

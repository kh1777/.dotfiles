return {
  "saghen/blink.cmp",
  opts = {
    keymap = {
      preset = "default",

      ["<Tab>"] = {
        function(cmp)
          if cmp.is_visible() then
            return cmp.select_and_accept()
          end
        end,
        "fallback",
      },

      ["<CR>"] = { "fallback" },
    },
  },
}

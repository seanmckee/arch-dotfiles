return {
  {
    "folke/tokyonight.nvim",
    opts = {
      -- Match kitty's "Tokyo Night Storm" palette exactly.
      -- LazyVim defaults to "moon" (#222436), kitty is storm (#24283b).
      style = "storm",

      -- Don't paint a background; let kitty's show through.
      transparent = true,

      styles = {
        sidebars = "transparent", -- neo-tree, terminal panes
        floats = "dark", -- keep popups/cmp/noice readable over code
      },
    },
  },
}

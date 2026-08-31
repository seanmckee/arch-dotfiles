local function desktop_palette()
  local state = vim.fn.expand("~/.local/state/nvim-theme-mode")
  if vim.fn.filereadable(state) ~= 1 or vim.trim(vim.fn.readfile(state)[1] or "") ~= "on" then
    return nil
  end

  local ok, palette = pcall(require, "theme.current")
  return ok and palette or nil
end

local palette = desktop_palette()

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

      -- Optional exact desktop-palette recoloring. Toggle with:
      --   theme nvim on|off
      on_colors = palette and function(colors)
        colors.bg = palette.bg
        colors.bg_dark = palette.bg_dark
        colors.bg_float = palette.bg_dark
        colors.bg_highlight = palette.sel
        colors.bg_popup = palette.bg_dark
        colors.bg_search = palette.sel
        colors.bg_sidebar = palette.bg_dark
        colors.bg_statusline = palette.bg_dark
        colors.bg_visual = palette.sel
        colors.border = palette.muted
        colors.comment = palette.muted
        colors.dark3 = palette.muted
        colors.fg = palette.fg
        colors.fg_dark = palette.dim
        colors.fg_float = palette.fg
        colors.fg_gutter = palette.muted
        colors.fg_sidebar = palette.dim
        colors.blue = palette.blue
        colors.blue0 = palette.accent2
        colors.blue1 = palette.blue
        colors.blue2 = palette.cyan
        colors.blue5 = palette.cyan
        colors.blue6 = palette.cyan
        colors.blue7 = palette.accent2
        colors.cyan = palette.cyan
        colors.error = palette.red
        colors.green = palette.green
        colors.green1 = palette.green
        colors.green2 = palette.cyan
        colors.hint = palette.cyan
        colors.info = palette.blue
        colors.magenta = palette.magenta
        colors.magenta2 = palette.accent
        colors.orange = palette.accent
        colors.purple = palette.magenta
        colors.red = palette.red
        colors.red1 = palette.red
        colors.teal = palette.cyan
        colors.terminal_black = palette.bg_dark
        colors.todo = palette.accent
        colors.warning = palette.yellow
        colors.yellow = palette.yellow
        colors.git.add = palette.green
        colors.git.change = palette.blue
        colors.git.delete = palette.red
        colors.git.ignore = palette.muted
        colors.diff.add = palette.sel
        colors.diff.change = palette.sel
        colors.diff.delete = palette.sel
        colors.diff.text = palette.accent2
      end or nil,
    },
  },
}

local M = {}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "round",
  }
}

M.base46 = {
  theme = "chadracula",
  theme_toggle = {"chadracula", "github_light"},
  transparency = false,

  -- HILIGHT SETTINGS
  hl_add = {},
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
  integrations = {},
}

return M

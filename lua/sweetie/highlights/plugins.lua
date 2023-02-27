local colors = require("sweetie.colors")
local current_bg = vim.opt.background:get()
local palette = colors.get_palette(current_bg)

--- Plugins sweetie highlighting groups
---@class plugins
local plugins = {}

--- Set up highlighting groups for plugins
---@param config
---@return table
plugins.setup = function(config)
  local highlights = {}
  local integrations = config.integrations

  if integrations.neorg then
    highlights = vim.tbl_extend("force", highlights, {
      ["@neorg.markup.verbatim"] = { fg = palette.dark_grey },
      -- Colors are for nested quotes
      Red = { fg = palette.red },
      Blue = { fg = palette.blue },
      Green = { fg = palette.green },
      Brown = { fg = palette.orange },
      Yellow = { fg = palette.yellow },
    })
  end
  if integrations.neogit then
    highlights = vim.tbl_extend("force", highlights, {
      NeogitFold = { link = "Folded" },
      NeogitBranch = { fg = palette.magenta },
      NeogitRemote = { fg = palette.violet },
      NeogitStashes = { fg = palette.blue, bold = true },
      NeogitHunkHeader = { fg = palette.fg, bg = "#303042" },
      NeogitHunkHeaderHighlight = { fg = palette.teal, bg = palette.bg_alt },
      NeogitDiffAdd = { fg = palette.green, bg = "#303042" },
      NeogitDiffAddHighlight = { fg = palette.green, bg = "#303042", bold = true },
      NeogitDiffDelete = { fg = palette.red, bg = "#303042" },
      NeogitDiffDeleteHighlight = { fg = palette.red, bg = "#303042", bold = true },
      NeogitDiffContext = { fg = palette.fg_alt, bg = palette.bg },
      NeogitDiffContextHighlight = { fg = palette.fg, bg = palette.bg_alt, bold = true },
      NeogitStagedChanges = { fg = palette.blue, bold = true },
      NeogitUnstagedChanges = { fg = palette.blue, bold = true },
      NeogitStagedChangesRegion = { bg = palette.bg_alt },
      NeogitUntrackedfiles = { fg = palette.violet, bold = true },
    })
  end
  if integrations.telescope then
    highlights = vim.tbl_extend("force", highlights, {
      TelescopeNormal = { fg = palette.fg },
      TelescopeBorder = { fg = palette.teal },
      TelescopePrompt = { link = "TelescopeNormal" },
      TelescopePromptBorder = { link = "TelescopeBorder" },
      TelescopePromptPrefix = { fg = palette.blue },
      TelescopeResultsBorder = { link = "TelescopeBorder" },
      TelescopePreviewBorder = { link = "TelescopeBorder" },
      TelescopeMatching = { fg = palette.violet, bold = true },
      TelescopeSelection = { link = "VisualBold" },
      TelescopeSelectionCaret = { fg = palette.blue },
    })
  end

  return highlights
end

return plugins

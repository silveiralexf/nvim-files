--  Borrowed from https://raw.githubusercontent.com/thanhvule0310/dotfiles/main/nvim/lua/theme.lua

local _M = {}

_M.colors = {
  bg = '#2e3440',
  fg = '#ECEFF4',
  red = '#bf616a',
  orange = '#d08770',
  yellow = '#ebcb8b',
  blue = '#5e81ac',
  green = '#a3be8c',
  cyan = '#88c0d0',
  magenta = '#b48ead',
  pink = '#FFA19F',
  grey1 = '#f8fafc',
  grey2 = '#f0f1f4',
  grey3 = '#eaecf0',
  grey4 = '#d9dce3',
  grey5 = '#c4c9d4',
  grey6 = '#b5bcc9',
  grey7 = '#929cb0',
  grey8 = '#8e99ae',
  grey9 = '#74819a',
  grey10 = '#616d85',
  grey11 = '#464f62',
  grey12 = '#3a4150',
  grey13 = '#333a47',
  grey14 = '#242932',
  grey15 = '#1e222a',
  grey16 = '#1c1f26',
  grey17 = '#0f1115',
  grey18 = '#0d0e11',
  grey19 = '#020203',
}

_M.init = function()
  local onenord_exists, onenord = pcall(require, 'onenord')
  if onenord_exists then
    onenord.setup {
      borders = true,
      fade_nc = true,
      styles = {
        comments = 'italic',
        strings = 'NONE',
        keywords = 'NONE',
        functions = 'italic',
        variables = 'bold',
        diagnostics = 'underline',
      },
      disable = {
        background = false,
        cursorline = true,
        eob_lines = true,
      },
      custom_highlights = {
        WhichKeyFloat = { bg = _M.colors.grey14 },

        GitSignsAdd = { fg = _M.colors.green },
        GitSignsChange = { fg = _M.colors.orange },
        GitSignsDelete = { fg = _M.colors.red },

        NvimTreeFolderIcon = { fg = _M.colors.grey9 },
        NvimTreeIndentMarker = { fg = _M.colors.grey12 },
        NvimTreeNormal = { fg = _M.colors.grey5, bg = _M.colors.grey14 },

        NormalFloat = { bg = _M.colors.grey14 },
        FloatBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },

        TelescopePromptPrefix = { bg = _M.colors.grey14 },
        TelescopePromptNormal = { bg = _M.colors.grey14 },
        TelescopeResultsNormal = { bg = _M.colors.grey15 },
        TelescopePreviewNormal = { bg = _M.colors.grey16 },
        TelescopePromptBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        TelescopeResultsBorder = { bg = _M.colors.grey15, fg = _M.colors.grey15 },
        TelescopePreviewBorder = { bg = _M.colors.grey16, fg = _M.colors.grey16 },
        TelescopePromptTitle = { fg = _M.colors.grey14 },
        TelescopeResultsTitle = { fg = _M.colors.grey15 },
        TelescopePreviewTitle = { fg = _M.colors.grey16 },

        PmenuSel = { bg = _M.colors.grey12 },
        Pmenu = { bg = _M.colors.grey14 },
        PMenuThumb = { bg = _M.colors.grey16 },

        LspFloatWinNormal = { fg = _M.colors.fg, bg = _M.colors.grey14 },
        LspFloatWinBorder = { fg = _M.colors.grey14 },

        NoiceCmdlineIconCmdline = { fg = _M.colors.yellow },
        NoiceCmdlineIconLua = { fg = _M.colors.magenta },
        NoiceCmdlineIconSearch = { fg = _M.colors.magenta },
        NoiceCmdlineIconHelp = { fg = _M.colors.blue },
        NoiceCmdlinePopupBorder = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        NoiceCmdlinePopupBorderCmdline = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        NoiceCmdlinePopupBorderLua = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        NoiceCmdlinePopupBorderSearch = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        NoiceCmdlinePopupBorderHelp = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        NoiceCmdlinePopupBorderFilter = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
        NoiceCmdlinePopupBorderInput = { bg = _M.colors.grey14, fg = _M.colors.grey14 },
      },
    }
  end
end

return _M

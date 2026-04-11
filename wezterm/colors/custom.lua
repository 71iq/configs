-- Toggle between 'mocha' (dark) and 'latte' (light)
local THEME = 'mocha' -- was 'latte'

-- stylua: ignore
local mocha = {
   rosewater = '#f5e0dc',
   flamingo  = '#f2cdcd',
   pink      = '#f5c2e7',
   mauve     = '#cba6f7',
   red       = '#f38ba8',
   maroon    = '#eba0ac',
   peach     = '#fab387',
   yellow    = '#f9e2af',
   green     = '#a6e3a1',
   teal      = '#94e2d5',
   sky       = '#89dceb',
   sapphire  = '#74c7ec',
   blue      = '#89b4fa',
   lavender  = '#b4befe',
   text      = '#cdd6f4',
   subtext1  = '#bac2de',
   subtext0  = '#a6adc8',
   overlay2  = '#9399b2',
   overlay1  = '#7f849c',
   overlay0  = '#6c7086',
   surface2  = '#585b70',
   surface1  = '#45475a',
   surface0  = '#313244',
   base      = '#1f1f28',
   mantle    = '#181825',
   crust     = '#11111b',
}

-- stylua: ignore
local latte = {
   rosewater = '#dc8a78',
   flamingo  = '#dd7878',
   pink      = '#ea76cb',
   mauve     = '#8839ef',
   red       = '#d20f39',
   maroon    = '#e64553',
   peach     = '#fe640b',
   yellow    = '#df8e1d',
   green     = '#40a02b',
   teal      = '#179299',
   sky       = '#04a5e5',
   sapphire  = '#209fb5',
   blue      = '#1e66f5',
   lavender  = '#7287fd',
   text      = '#4c4f69',
   subtext1  = '#5c5f77',
   subtext0  = '#6c6f85',
   overlay2  = '#7c7f93',
   overlay1  = '#8c8fa1',
   overlay0  = '#9ca0b0',
   surface2  = '#acb0be',
   surface1  = '#bcc0cc',
   surface0  = '#ccd0da',
   base      = '#eff1f5',
   mantle    = '#e6e9ef',
   crust     = '#dce0e8',
}

local palette = THEME == 'latte' and latte or mocha

local colorscheme = {
   foreground = palette.text,
   background = palette.base,
   cursor_bg = palette.rosewater,
   cursor_border = palette.rosewater,
   cursor_fg = palette.crust,
   selection_bg = palette.surface2,
   selection_fg = palette.text,
   ansi = {
      '#0C0C0C', -- black
      '#C50F1F', -- red
      '#13A10E', -- green
      '#C19C00', -- yellow
      '#0037DA', -- blue
      '#881798', -- magenta/purple
      '#3A96DD', -- cyan
      '#CCCCCC', -- white
   },
   brights = {
      '#767676', -- black
      '#E74856', -- red
      '#16C60C', -- green
      '#F9F1A5', -- yellow
      '#3B78FF', -- blue
      '#B4009E', -- magenta/purple
      '#61D6D6', -- cyan
      '#F2F2F2', -- white
   },
   tab_bar = {
      background = 'rgba(0, 0, 0, 0.4)',
      active_tab = {
         bg_color = palette.surface2,
         fg_color = palette.text,
      },
      inactive_tab = {
         bg_color = palette.surface0,
         fg_color = palette.subtext1,
      },
      inactive_tab_hover = {
         bg_color = palette.surface0,
         fg_color = palette.text,
      },
      new_tab = {
         bg_color = palette.base,
         fg_color = palette.text,
      },
      new_tab_hover = {
         bg_color = palette.mantle,
         fg_color = palette.text,
         italic = true,
      },
   },
   visual_bell = palette.red,
   indexed = {
      [16] = palette.peach,
      [17] = palette.rosewater,
   },
   scrollbar_thumb = palette.surface2,
   split = palette.overlay0,
   compose_cursor = palette.flamingo,
}

return { scheme = colorscheme, palette = palette }

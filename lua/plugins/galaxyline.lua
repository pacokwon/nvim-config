local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui'}

local normal_bg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name ("Normal"), "bg")

local colors = {
  bg = normal_bg,
  fg = '#abb2bf',
  section_bg = '#38393f',
  blue = '#61afef',
  green = '#98c379',
  purple = '#c678dd',
  orange = '#e5c07b',
  red = '#e06c75',
  yellow = '#e5c07b',
  darkgrey = '#2c323d',
  middlegrey = '#8791A5',
}

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true
  end
  return false
end

local has_width_gt = function(cols)
  -- check if the windows width is greater than the given number of columns
  return vim.fn.winwidth(0) / 2 > cols
end

local mode_color = function()
  local mode_colors = {
    [110] = colors.green,
    [105] = colors.blue,
    [99] = colors.yellow,
    [116] = colors.blue,
    [118] = colors.purple,
    [22] = colors.purple,
    [86] = colors.purple,
    [82] = colors.red,
    [115] = colors.red,
    [83] = colors.red,
  }

  local color = mode_colors[vim.fn.mode():byte()]
  if color ~= nil then
    return color
  else
    return colors.purple
  end
end

gls.left[1] = {
  RainbowLeft = {
    provider = function()
      vim.api.nvim_command('hi GalaxyRainbowLeft guifg=' .. mode_color())
      return '▊ '
    end,
    highlight = { colors.blue, colors.bg }
  },
}

gls.left[2] = {
  ViMode = {
    provider = function()
      -- auto change color according the vim mode
      local aliases = {
        [110] = 'NORMAL',
        [105] = 'INSERT',
        [99] = 'COMMAND',
        [116] = 'TERMINAl',
        [118] = 'VISUAL',
        [22] = 'V-BLOCK',
        [86] = 'V-LINE',
        [82] = 'REPLACE',
        [115] = 'SELECT',
        [83] = 'S-LINE',
      }
      vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color())
      local alias = aliases[vim.fn.mode():byte()]
      local mode
      if alias ~= nil then
        if has_width_gt(36) then
          mode = alias
        else
          mode = alias:sub(1, 1)
        end
      else
        mode = vim.fn.mode():byte()
      end
      return ' ' .. mode .. ' '
    end,
    highlight = { colors.red, colors.bg, 'bold' },
  },
}

gls.left[3] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = buffer_not_empty,
    highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.bg },
  },
}

gls.left[4] = {
  FileName = {
    provider = {'FileName'},
    condition = buffer_not_empty,
    highlight = { colors.yellow, colors.bg, 'bold' }
  }
}

gls.left[5] = {
  LineInfo = {
    provider = 'LineColumn',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
    highlight = { colors.yellow, colors.bg },
  },
}

gls.left[6] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = { colors.red, colors.bg }
  }
}
gls.left[7] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = { colors.yellow, colors.bg },
  }
}

gls.left[8] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = { colors.blue, colors.bg },
  }
}

gls.left[9] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = { colors.blue, colors.bg },
  }
}

gls.right[1] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = function() has_width_gt(36) end,
    icon = '+',
    highlight = { colors.green, colors.bg, 'bold' },
    separator = ' ',
    separator_highlight = { colors.bg, colors.bg },
  }
}

gls.right[2] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = function() has_width_gt(36) end,
    icon = '~',
    highlight = { colors.orange, colors.bg, 'bold' },
  }
}

gls.right[3] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = function() has_width_gt(36) end,
    icon = '-',
    highlight = { colors.red, colors.bg, 'bold' },
  }
}

gls.right[4] = {
  FileEncode = {
    provider = 'FileEncode',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = { colors.blue, colors.bg, 'bold' }
  }
}

gls.right[5] = {
  FileFormat = {
    provider = 'FileFormat',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
    highlight = { colors.blue, colors.bg, 'bold' }
  }
}

gls.right[6] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = { colors.purple, colors.bg, 'bold' },
  }
}

gls.right[7] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = require('galaxyline.provider_vcs').check_git_workspace,
    highlight = { colors.purple, colors.bg, 'bold' },
  }
}

gls.right[8] = {
  RainbowRight = {
    provider = function()
      vim.api.nvim_command('hi GalaxyRainbowRight guifg=' .. mode_color())
      return '  ▊'
    end,
    highlight = { colors.blue, colors.bg }
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = { 'NONE', colors.bg },
    highlight = { colors.blue, colors.bg, 'bold' }
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider = function ()
      local fileinfo = require('galaxyline.provider_fileinfo')
      local fname = fileinfo.get_current_file_name()
      for _,v in ipairs(gl.short_line_list) do
        if v == vim.bo.filetype then
          return ''
        end
      end
      return fname
    end,
    condition = buffer_not_empty,
    highlight = { colors.white, colors.bg, 'bold' }
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = { colors.fg, colors.bg }
  }
}

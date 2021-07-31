-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/pacokwon/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/pacokwon/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/pacokwon/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/pacokwon/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/pacokwon/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  fzf = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/fzf.vim"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["github-nvim-theme"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["haskell-vim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/haskell-vim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  melange = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/melange"
  },
  ["neovim-ayu"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/neovim-ayu"
  },
  ["night-owl.vim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/night-owl.vim"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-metals"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/nvim-metals"
  },
  ["nvim-miniyank"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/nvim-miniyank"
  },
  ["nvim-toggleterm.lua"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/nvim-toggleterm.lua"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/oceanic-next"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/onedark.nvim"
  },
  ["onedarkpaco.vim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/onedarkpaco.vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["panic.vim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/panic.vim"
  },
  ["pears.nvim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/pears.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rust.vim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/rust.vim"
  },
  ["srcery-vim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/srcery-vim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/tokyonight.nvim"
  },
  ["vifm.vim"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/vifm.vim"
  },
  ["vim-colors-xcode"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/vim-colors-xcode"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/vim-exchange"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-jsx-typescript"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/vim-jsx-typescript"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-styled-components"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/vim-styled-components"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-vue-plugin"] = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/vim-vue-plugin"
  },
  vimwiki = {
    loaded = true,
    path = "/Users/pacokwon/.local/share/nvim/site/pack/packer/start/vimwiki"
  }
}

time([[Defining packer_plugins]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end

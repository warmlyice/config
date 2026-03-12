-- Set fold method to 'indent' for automatic folding based on indentation
vim.opt.foldmethod = "indent"
-- Ensure folding is enabled by default
vim.opt.foldenable = true
-- Set the default fold level to 99 so all folds are initially open
vim.opt.foldlevel = 99


require'nvim-web-devicons'.setup {
 -- your personal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable different highlight colors per icon (default to true)
 -- if set to false all icons will have the default icon's color
 color_icons = true;
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
 -- globally enable "strict" selection of icons - icon will be looked up in
 -- different tables, first by filename, and if not found by extension; this
 -- prevents cases when file doesn't have any extension but still gets some icon
 -- because its name happened to match some extension (default to false)
 strict = true;
 -- set the light or dark variant manually, instead of relying on `background`
 -- (default to nil)
 variant = "light|dark";
 -- override blend value for all highlight groups :h highlight-blend.
 -- setting this value to `0` will make all icons opaque. in practice this means
 -- that icons width will not be affected by pumblend option (see issue #608)
 -- (default to nil)
 blend = 0;
 -- same as `override` but specifically for overrides by filename
 -- takes effect when `strict` is true
 override_by_filename = {
  [".gitignore"] = {
    icon = "",
    color = "#f1502f",
    name = "Gitignore"
  }
 };
 -- same as `override` but specifically for overrides by extension
 -- takes effect when `strict` is true
 override_by_extension = {
  ["log"] = {
    icon = "",
    color = "#81e043",
    name = "Log"
  }
 };
 -- same as `override` but specifically for operating system
 -- takes effect when `strict` is true
 override_by_operating_system = {
  ["apple"] = {
    icon = "",
    color = "#A2AAAD",
    cterm_color = "248",
    name = "Apple",
  },
 };
}
require'nvim-tree'.setup({
  view = {
    side = 'right',
  },
})

require("fzf-lua").setup {
}

local dap = require"dap"

dap.configurations.lua = { 
  { 
    type = 'nlua', 
    request = 'attach',
    name = "Attach to running Neovim instance",
  }
}

dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end


local dapui = require("dapui")
dapui.setup()
dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  dapui.close()
end
require'nvim-treesitter'.setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require'nvim-treesitter'.install { 'python' }
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'py' },
  callback = function() vim.treesitter.start() end,
})
require("nvim-dap-virtual-text").setup({
  --virt_text_pos = vim.fn.has 'nvim-0.10' == 1 and 'inline' or 'eol',
  virt_text_pos = 'eol',

})

require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")


dap.adapters["local-lua"] = {
  type = "executable",
  command = "node",
  args = {
    "/home/storm/.local/share/nvim/local-lua-debugger-vscode/extension/debugAdapter.js"
  },
  enrich_config = function(config, on_config)
    if not config["extensionPath"] then
      local c = vim.deepcopy(config)
      -- 💀 If this is missing or wrong you'll see 
      -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
      c.extensionPath = "/home/storm/.local/share/nvim/local-lua-debugger-vscode"
      on_config(c)
    else
      on_config(config)
    end
  end,
}

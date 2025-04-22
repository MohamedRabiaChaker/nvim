local config = require "plugins.configs.lspconfig"

local lspconfig = require "lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities

local function get_python_path_for_project()
  local venv_path = vim.fn.findfile("bin/activate", vim.fn.getcwd() .. ";../;../../;")
  print(venv_path)
  if venv_path ~= "" then
    return vim.fn.fnamemodify(venv_path, ":h:h") .. "/bin/python"
  end

  return "/Users/mohamed.chaker/.pyenv/shims/python"
end

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  python = {
    settings = {
      python = get_python_path_for_project(),
    },
  },
}

lspconfig.metals.setup {
  init_options = {
    statusBarProvider = "on",
    isHttpEnabled = true,
  },
  filetypes = { "scala", "sbt" },
  settings = {
    metals = {
      serverProperties = {},
      useGlobalExecutable = true, -- Use the `metals` from coursier
    },
  },
  on_attach = function(client, bufnr)
    -- optional keybindings, lsp status, etc.
    print("Metals attached to buffer", bufnr)
  end,
}

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "scala", "sbt" },
  callback = function()
    lspconfig.metals.setup {} -- Ensure it's initialized
    vim.cmd "LspStart" -- Start the LSP
  end,
})

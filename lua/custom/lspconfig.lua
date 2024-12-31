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

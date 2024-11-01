-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local is_tmux = os.getenv("TMUX")

-- Some OS detectors
local is_wsl = vim.fn.has("wsl") == 1
-- local is_mac = vim.fn.has("macunix") == 1
-- local is_linux = not is_wsl and not is_mac

if is_wsl and is_tmux then
  -- Do nothing
  -- Don't set any clipboard setting when using tmux in WSL
elseif is_wsl then
  -- WSL Clipboard support
  -- This is NeoVim's recommended way to solve clipboard sharing if you use WSL
  -- See: https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
      ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0,
  }
end

vim.g.python_host_prog = "/home/gabriel/.pyenv/versions/py3nvim/bin/python"
vim.g.python3_host_prog = "/home/gabriel/.pyenv/versions/py3nvim/bin/python"

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

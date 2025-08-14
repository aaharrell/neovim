vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "]g", vim.diagnostic.goto_next)
vim.keymap.set("n", "[g", vim.diagnostic.goto_prev)

-- Fix copy/paste issue for linux
if vim.fn.has("wsl") == 1 then
  vim.g.clipboard = {
    name = "win32yank-wsl",
    copy = {["+"] = "win32yank.exe -i --crlf", ["*"] = "win32yank.exe -i --crlf"},
    paste = {["+"] = "win32yank.exe -o --lf",  ["*"] = "win32yank.exe -o --lf"},
    cache_enabled = 0,
  }
end
vim.opt.clipboard = "unnamedplus"

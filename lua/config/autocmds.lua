-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = false
    vim.opt_local.textwidth = 120
    vim.opt_local.wrap = true

    -- Keymaps

    local opts = { buffer = true, noremap = true, silent = true }

    -- Wrap selection with **
    vim.keymap.set("v", "<leader>b", 'c**<C-r>"**<Esc>', opts)

    -- Wrap selection with *
    vim.keymap.set("v", "<leader>i", 'c*<C-r>"*<Esc>', opts)

    -- Wrap selection with backticks for inline code
    vim.keymap.set("v", "<leader>c", 'c`<C-r>"`<Esc>', opts)

    -- Insert code block
    vim.keymap.set("n", "<leader>cb", "o```<CR><CR>```<Esc>k", opts)

    -- Insert link: [text](url)
    vim.keymap.set("v", "<leader>l", 'c[<C-r>"]()<Esc>F)i', opts)

    -- Insert image: ![alt](url)
    vim.keymap.set("v", "<leader>p", 'c![<C-r>"]()<Esc>F)i', opts)

    -- Heading levels
    vim.keymap.set("n", "<leader>1", "0i# <Esc>", opts)
    vim.keymap.set("n", "<leader>2", "0i## <Esc>", opts)
    vim.keymap.set("n", "<leader>3", "0i### <Esc>", opts)
  end,
})

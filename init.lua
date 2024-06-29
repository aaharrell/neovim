-- Load custom settings and plugins
require("harrell")

-- Function to set and log the current Neovim directory
_G.set_nvim_dir = function()
    -- Change the directory to the directory of the current file
    vim.cmd('cd %:h')

    -- Get the current working directory
    local current_dir = vim.fn.getcwd()

    -- Write the current directory to the file
    local file_path = vim.fn.expand("~") .. '/nvim-last-dir.txt'
    local file = io.open(file_path, 'w')
    if file then
        file:write(current_dir)
        file:close()
    end
end

-- Create a custom command to write the directory
vim.api.nvim_create_user_command('WriteNvimDir', _G.set_nvim_dir, {})

-- Optionally, bind this command to a key mapping
vim.api.nvim_set_keymap('n', '<leader>wd', ':lua set_nvim_dir()<CR>', { noremap = true, silent = true })


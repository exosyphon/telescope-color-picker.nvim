local M = {}

M.choose_colors = function()
    local actions = require "telescope.actions"
    local actions_state = require "telescope.actions.state"
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local sorters = require "telescope.sorters"
    local dropdown = require "telescope.themes".get_dropdown()

    local function enter(bufnr)
        local selected = actions_state.get_selected_entry()
        local cmd = 'colorscheme ' .. selected[1]
        vim.cmd(cmd)
        local init_cmd = 'vim.cmd("' .. cmd .. '")'
        local init_file = vim.fn.expand(vim.fn.stdpath('config') .. "/init.lua")
        vim.fn.jobstart("if [[ $(cat " ..
            init_file ..
            " | grep -e 'vim.*cmd.*colorscheme') ]]; then sed -i -e /colorscheme/d " ..
            init_file .. "; fi && echo '" .. init_cmd .. "' >> " .. init_file)
        actions.close(bufnr)
    end

    local function next_color(bufnr)
        actions.move_selection_next(bufnr)
        local selected = actions_state.get_selected_entry()
        local cmd = 'colorscheme ' .. selected[1]
        vim.cmd(cmd)
    end

    local function prev_color(bufnr)
        actions.move_selection_previous(bufnr)
        local selected = actions_state.get_selected_entry()
        local cmd = 'colorscheme ' .. selected[1]
        vim.cmd(cmd)
    end

    local installedColors = vim.fn.getcompletion("", "color")

    local opts = {
        finder = finders.new_table(installedColors),
        sorter = sorters.get_generic_fuzzy_sorter({}),

        attach_mappings = function(_, map)
            map("i", "<CR>", enter)
            map("i", "<C-j>", next_color)
            map("i", "<C-k>", prev_color)
            return true
        end,

    }

    local colors = pickers.new(dropdown, opts)

    colors:find()
end

return M

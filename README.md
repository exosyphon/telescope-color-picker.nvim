# Telescope Color Picker Extension
A [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) extension for picking colorschemes on your system that persists after selection.

Note: This plugin will write to your`<nvim_config_dir>/init.lua`

## Usage
After invoking `Telescope colors` you can browse the available colors using `C-j` `C-n` or `Up arrow`, which will update your colorscheme on each selection.
Go down using `C-k` `C-p` or `Down arrow`. Hit `<CR>` to persist your selection to the `<nvim_config_dir>/init.lua` file.

## Requirements
- awk
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) 

## Installation
```lua
require("lazy").setup(
    {
        "exosyphon/telescope-color-picker.nvim",
        dependencies = {
            { 'nvim-telescope/telescope.nvim' },
        },
        config = function()
              require("telescope").load_extension "colors"
        end,
    }
)
```

## Add extension to Telescope (If not in config above)
```lua
require("telescope").load_extension("colors")

```

## Run
```
:Telescope colors
```

## Mappings
```lua
vim.keymap("n", "<leader>uC", "<cmd>Telescope colors<CR>", desc = { "Color Picker" })
```

## Contributions
Suggestions, issues and patches are very much welcome.

# Telescope Color Picker Extension
A [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) extension for picking colorschemes on your system that persists after selection.

Note: This plugin will write to your ~/.config/nvim/init.lua 

### Requirements
- awk
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) 

### Install
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

### Add extension to Telescope (If not in config above)
```lua
require("telescope").load_extension("colors")

```

### Run
```
:Telescope colors
```

### Mappings
```lua
vim.keymap("n", "<leader>uC", "<cmd>Telescope colors<CR>", desc = { "Color Picker" })
```

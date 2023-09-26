local has_telescope, telescope = pcall(require, "telescope")
if not has_telescope then
    error("telescope-color-picker.nvim requires telescope.nvim - https://github.com/nvim-telescope/telescope.nvim")
end

local colors = function()
    require("telescope-color-picker").colors(require("telescope.themes").get_dropdown {})
end

return require("telescope").register_extension {
    setup = function(ext_config, config)
        -- access extension config and user config
    end,
    exports = {
        colors = colors,
    },
}

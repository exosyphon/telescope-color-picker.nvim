return require("telescope").register_extension {
  setup = function(ext_config, config)
    -- access extension config and user config
  end,
  exports = {
    colors = require("telescope-color-picker").colors(require("telescope.themes").get_dropdown {})
  },
}

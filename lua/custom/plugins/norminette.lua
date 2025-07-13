return {
  'hardyrafael17/norminette42.nvim',
  config = function()
    local norminette = require 'norminette'
    norminette.setup {
      runOnSave = true, -- Optional, check for errors after save
      maxErrorsToShow = 5, -- Only show 5 errors
      active = true, -- Optional, can be set to false to deactivate plugin
    }
  end,
}

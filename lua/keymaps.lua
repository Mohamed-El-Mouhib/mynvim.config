-- ************************************************************************** --
--                                                                            --
--                                                        :::      ::::::::   --
--   keymaps.lua                                        :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: mel-mouh <mel-mouh@student.1337.fr>        +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2025/07/18 19:05:33 by mel-mouh          #+#    #+#             --
--   Updated: 2025/07/18 19:05:36 by mel-mouh         ###   ########.fr       --
--                                                                            --
-- ************************************************************************** --

vim.keymap.set('n', '<leader>e', ':Neotree toggle<CR>', { desc = 'Toggle Neo-tree' })
vim.keymap.set('n', '<leader>lv', '<cmd>Telescope live_grep<CR>', { desc = 'Telescope Live Grep' })
vim.keymap.set('n', '<leader>qn', '<cmd>NorminetteDisable<CR>', { desc = 'Disable Norm' })
vim.keymap.set('n', '<leader>qm', '<cmd>NorminetteEnable<CR>', { desc = 'Enable Norm' })
vim.keymap.set('n', '<leader>qc', '<cmd>CopilotChat<CR>', { desc = 'Talk to AI' })

return {
	-- messages, cmdline and the popupmenu
	{
		"folke/noice.nvim",
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
	},

	{
		"rcarriga/nvim-notify",
		opts = {
			timeout = 5000,
		},
	},

	-- animations
	{
		"echasnovski/mini.animate",
		event = "VeryLazy",
		opts = function(_, opts)
			opts.scroll = {
				enable = false,
			}
		end,
	},

	-- buffer line
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		-- keys = {
		-- 	{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
		-- 	{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
		-- },
		opts = {
			options = {
				mode = "tabs",
				-- separator_style = "slant",
				show_buffer_close_icons = false,
				show_close_icon = false,
			},
		},
	},

	-- -- filename
	-- {
	-- 	"b0o/incline.nvim",
	-- 	dependencies = { "craftzdog/solarized-osaka.nvim" },
	-- 	event = "BufReadPre",
	-- 	priority = 1200,
	-- 	config = function()
	-- 		local colors = require("solarized-osaka.colors").setup()
	-- 		require("incline").setup({
	-- 			highlight = {
	-- 				groups = {
	-- 					InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
	-- 					InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
	-- 				},
	-- 			},
	-- 			window = { margin = { vertical = 0, horizontal = 1 } },
	-- 			render = function(props)
	-- 				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
	-- 				if vim.bo[props.buf].modified then
	-- 					filename = "[+] " .. filename
	-- 				end
	--
	-- 				local icon, color = require("nvim-web-devicons").get_icon_color(filename)
	-- 				return { { icon, guifg = color }, { " " }, { filename } }
	-- 			end,
	-- 		})
	-- 	end,
	-- },

	-- statusline
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		opts = function(_, opts)
			local luna = {
				"       ,                                  ",
				"       \\`-._           __                 ",
				"        \\\\  `-..____,.'  `.               ",
				"         :`.         /    \\`.             ",
				"         :  )       :      : \\            ",
				"          ;'        '   ;  |  :           ",
				"          )..      .. .:.`.;  :           ",
				"         /::...  .:::...   ` ;            ",
				"         ; _ '    __        /:\\           ",
				"         `:o>   /\\o_>      ;:. `.         ",
				"        `-`.__ ;   __..--- /:.   \\        ",
				"        === \\_/   ;=====_.':.     ;       ",
				"         ,/'`--'...`--....        ;       ",
				"              ;                    ;      ",
				"            .'                      ;     ",
				"          .'                        ;     ",
				"        .'     ..     ,      .       ;    ",
				"       :       ::..  /      ;::.     |    ",
				"      /      `.;::.  |       ;:..    ;    ",
				"     :         |:.   :       ;:.    ;     ",
				"     :         ::     ;:..   |.    ;      ",
				"      :       :;      :::....|     |      ",
				"      /\\     ,/ \\      ;:::::;     ;      ",
				"    .:. \\:..|    :     ; '.--|     ;      ",
				"   ::.  :''  `-.,,;     ;'   ;     ;      ",
				".-'. _.'\\      / `;      \\,__:      \\     ",
				"`---'    `----'   ;      /    \\,.,,,/     ",
				"                   `----`                 ",
			}
			opts.config.header = luna
		end,
	},
}

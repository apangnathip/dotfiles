return {
	"goolord/alpha-nvim",
	dependencies = { "echasnovski/mini.icons" },
	config = function()
		local alpha = require("alpha")
		local startify = require("alpha.themes.startify")

		startify.section.header.val = {
			"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
			"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
			"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
			"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
			"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
			"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
		}

		startify.section.top_buttons.val = {
			startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			startify.button("f", "  Find file", "<CMD>Telescope find_files<CR>"),
			startify.button("r", "  Restore Session", "<CMD>SessionRestore<CR>"),
		}

		startify.section.mru.val = { { type = "padding", val = 0 } }
		startify.section.mru_cwd.val[2].val = "MRU @  " .. vim.fn.getcwd()
		startify.section.bottom_buttons.val = {}

		local handle = io.popen("fortune")

		if handle then
			local fortune = handle:read("*a")
			handle:close()
			startify.section.footer.val = {
				{ type = "text", val = fortune },
			}
		end

		alpha.setup(startify.config)
	end,
}

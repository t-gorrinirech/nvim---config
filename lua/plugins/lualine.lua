-- return {
-- 	{
-- 		"nvim-lualine/lualine.nvim",
-- 		event = "ColorScheme", -- Cargar cuando se establezca el esquema de colores
-- 		config = function()
-- 			require("lualine").setup({
-- 				options = {
-- 					-- Usa el tema de rose-pine para el lualine
-- 					theme = "nightfly",
-- 				},
-- 			})
-- 		end,
-- 		dependencies = { "nvim-tree/nvim-web-devicons", "bluz71/vim-nightfly-colors" },
-- 	},
-- }

return {
	"nvim-lualine/lualine.nvim",
	-- Quita 'event' o usa 'VeryLazy' para asegurar que no interfiera con la carga del tema
	-- event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nightfly", -- Depende del 'name' del plugin del colorscheme
	},
	config = function()
		-- Asegurarse de que el tema nightfly está disponible y aplicarlo a lualine
		require("lualine").setup({
			options = {
				theme = "nightfly",
				icons_enabled = true, -- Habilita iconos si usas nvim-web-devicons
				-- component_separators = { left = '', right = ''}, -- Ejemplo separadores
				-- section_separators = { left = '', right = ''}, -- Ejemplo separadores
				-- ... otras opciones de lualine ...
			},
			-- Puedes definir/personalizar secciones aquí si quieres
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { { "filename", path = 1 } }, -- Mostrar solo nombre de archivo relativo
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}

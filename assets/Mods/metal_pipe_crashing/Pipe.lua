--- STEAMODDED HEADER
--- MOD_NAME: Metal Pipe Crashing Noise
--- MOD_ID: PipeCrash
--- MOD_AUTHOR: [WilsontheWolf]
--- MOD_DESCRIPTION: THUD, CLANG
--- VERSION: 1.0
--- PREFIX: PipeCrash
--- DEPENDENCIES: [Steamodded>=1.0.0~ALPHA-0919a]

pipe_crash_sound = SMODS.Sound({
    key = "pipe_crash_sound",
    path = "pipe.ogg"
})

pip_config = SMODS.current_mod.config

local Tabs = function() return {
	{
		label = "Configuration",
		chosen = true,
		tab_definition_function = function()
			ror_nodes = {}
			settings = { n = G.UIT.C, config = { align = "tm", padding = 0.05 }, nodes = {} }
      settings.nodes[#settings.nodes + 1] =
      create_toggle({ label = "Enable", ref_table = pip_config, ref_value = "Enable" })
			config = { n = G.UIT.R, config = { align = "tm", padding = 0 }, nodes = { settings } }
			ror_nodes[#ror_nodes + 1] = config
			return {
				n = G.UIT.ROOT,
				config = {
					emboss = 0.05,
					minh = 6,
					r = 0.1,
					minw = 10,
					align = "cm",
					padding = 0.2,
					colour = G.C.BLACK,
				},
				nodes = ror_nodes,
			}
		end,
	},
} end
SMODS.current_mod.extra_tabs = Tabs
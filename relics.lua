relic_table = { -- Number, Description
   {'1', 'Achieve ultimate power.'},
   {'2', 'Build a core..'},
   {'3', 'Blocks of diamond and gold.'},
   {'4', 'Cones atop the gold.'},
   {'5', 'Crystal above two diamond.'},
   {'6', 'Diamond in the center.'},
   {'7', 'Gold to the N, S, E, and W.'},
   {'8', 'Two spaces between blocks.'},
   {'9', 'If correct will generate power.'},
}

for i in ipairs (relic_table) do
   local num = relic_table[i][1]
   local desc = relic_table[i][2]

minetest.register_craftitem('illuminati:relic_'..num, {
   description = desc,
   inventory_image = 'illuminati_relic_'..num..'.png',
   groups = {not_in_creative_inventory=1},
})
end

-- Register nodes
minetest.register_node("illuminati:stone", {
	description = "Stone",
	tiles = {"default_stone.png"},
	groups = {cracky=3, stone=1},
	drop = {
		max_items = 2,
		items = {
			{
			items = {'illuminati:relic_1'},
			rarity = 15,
			},
			{
			items = {'illuminati:relic_2'},
			rarity = 15,
			},
			{
			items = {'illuminati:relic_3'},
			rarity = 15,
			},
			{
			items = {'illuminati:relic_4'},
			rarity = 15,
			},
         {
			items = {'illuminati:relic_5'},
			rarity = 15,
			},
         {
			items = {'illuminati:relic_6'},
			rarity = 15,
			},
         {
			items = {'illuminati:relic_7'},
			rarity = 15,
			},
         {
			items = {'illuminati:relic_8'},
			rarity = 15,
			},
         {
			items = {'illuminati:relic_9'},
			rarity = 15,
			},
			{
			items = {'default:cobble'},
			},
		},
	},
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

-- Register ore
minetest.register_ore({
   ore_type = 'scatter',
   ore = 'illuminati:stone',
   wherein = 'default:stone',
   clust_scarcity = 8*8*8,
   clust_size = 1,
   height_min = -31000,
   hieght_max = 128,
})

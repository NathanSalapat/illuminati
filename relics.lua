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

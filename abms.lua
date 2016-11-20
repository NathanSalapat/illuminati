illuminati_gift_table1 = { --Common items
   'default:cobble',
   'default:obsidian',
   'default:mese_crystal_fragment',
}

illuminati_gift_table2 = { --Rare items
   'default:mese',
   'default:diamondblock',
   'default:goldblock',
}

illuminati_gift_table3 = { --Super rare items
   'illuminati:core_off',
   'illuminati:cone_off',
}

function give_gift(pos, table)
   local meta = minetest.env:get_meta(pos)
   local inv = meta:get_inventory()
   local max = #(table)
   local gift_num = math.random(1,max)
   local gift = table[gift_num]
   inv:set_stack('dst', 1, gift)
end

minetest.register_abm({
   nodenames = {'illuminati:core_on'},
	interval = 60,
	chance = 5,
   action = function(pos)
      local gift_type = math.random(1,10)
      if gift_type <= 1 then --Super rare item
         give_gift(pos, illuminati_gift_table3)
      end
      if gift_type >= 2 and gift_type <= 8 then --Comon item
         give_gift(pos, illuminati_gift_table1)
      end
      if gift_type > 8 then --Rare item
         give_gift(pos, illuminati_gift_table2)
      end
   end
})

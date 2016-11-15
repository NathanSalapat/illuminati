-- Craft Recipes
minetest.register_craft({
      output = 'illuminati:core_off',
      recipe = {
         {'dye:red', 'default:mese_crystal', 'dye:red'},
         {'dye:red', 'default:diamond', 'dye:red'},
         {'default:obsidian_shard', 'default:obsidian_shard', 'default:obsidian_shard'},
         }
})

minetest.register_craft({
      output = 'illuminati:cone_off',
      recipe = {
         {'', 'default:mese_crystal_fragment', ''},
         {'default:mese_crystal_fragment', 'default:gold_ingot', 'default:mese_crystal_fragment'},
         {'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot'},
         }
})

-- Node Registration
minetest.register_node('illuminati:core_off',{
  description = 'The source of power',
  drawtype = 'mesh',
  mesh = 'illuminati_core_off.obj',
  tiles = {name='illuminati_crystal.png'},
  use_texture_alpha = true,
  groups = {cracky=2},
  paramtype = 'light',
  paramtype2 = 'facedir',
  selection_box = {
     type = 'fixed',
     fixed = {-.4, -.5, -.4, .4, .5, .4},
     },
  collision_box = {
     type = 'fixed',
     fixed = {-.4, -.5, -.4, .4, .5, .4},
     },
   after_place_node = function(pos, itemstack)
     local n = minetest.get_node(pos)
     local p1 = {x=pos.x, y=pos.y-1, z=pos.z}
     local p2 = {x=pos.x, y=pos.y-2, z=pos.z}
     local n1 = minetest.get_node_or_nil(p1)
     local n2 = minetest.get_node_or_nil(p2)
     if n1.name == 'default:diamondblock' and n2.name == 'default:diamondblock' then
        local ps1 = {x=pos.x-3, y=pos.y-1, z=pos.z}
        local pw1 = {x=pos.x+3, y=pos.y-1, z=pos.z}
        local pn1 = {x=pos.x, y=pos.y-1, z=pos.z-3}
        local pe1 = {x=pos.x, y=pos.y-1, z=pos.z+3}
        local ns1 = minetest.get_node_or_nil(ps1)
        local nw1 = minetest.get_node_or_nil(pw1)
        local nn1 = minetest.get_node_or_nil(pn1)
        local ne1 = minetest.get_node_or_nil(pe1)
        if ns1.name == 'illuminati:cone_off' and nw1.name == 'illuminati:cone_off' and nn1.name == 'illuminati:cone_off' and ne1.name == 'illuminati:cone_off' then
           local ps2 = {x=pos.x-3, y=pos.y-2, z=pos.z}
           local pw2 = {x=pos.x+3, y=pos.y-2, z=pos.z}
           local pn2 = {x=pos.x, y=pos.y-2, z=pos.z-3}
           local pe2 = {x=pos.x, y=pos.y-2, z=pos.z+3}
           local ns2 = minetest.get_node_or_nil(ps2)
           local nw2 = minetest.get_node_or_nil(pw2)
           local nn2 = minetest.get_node_or_nil(pn2)
           local ne2 = minetest.get_node_or_nil(pe2)
           if ns2.name == 'default:goldblock' and nw2.name == 'default:goldblock' and nn2.name == 'default:goldblock' and ne2.name == 'default:goldblock' then
   			   minetest.set_node(pos,{name = 'illuminati:core_on', param2=n.param2})
               minetest.set_node(ps1,{name = 'illuminati:cone_on'})
               minetest.set_node(pw1,{name = 'illuminati:cone_on'})
               minetest.set_node(pn1,{name = 'illuminati:cone_on'})
               minetest.set_node(pe1,{name = 'illuminati:cone_on'})
            end
         end
      end
   end,
})

minetest.register_node('illuminati:core_on',{
  description = 'Hacked if you have this.',
  drawtype = 'mesh',
  mesh = 'illuminati_core_on.obj',
  tiles = {{name = 'illuminati_crystal.png'},
     {name='illuminati_power.png',
      animation = {
            type = "vertical_frames",
            aspect_w = 256,
            aspect_h = 32,
            length = 2.0,},},
         },
  use_texture_alpha = true,
  light_source = 13,
  groups = {cracky=3, not_in_creative_inventory=1},
  paramtype = 'light',
  paramtype2 = 'facedir',
  drop = 'illuminati:core_off',
  selection_box = {
     type = 'fixed',
     fixed = {-.4, -.5, -.4, .4, .5, .4},
     },
  collision_box = {
     type = 'fixed',
     fixed = {-.4, -.5, -.4, .4, .5, .4},
     },
  on_construct = function(pos)
    print 'seeing if this calls when the node is placed.'
    -- I'll eventually make something happen more than changing the nodes.
    -- Maybe the crystals with generate some items or do something.
  end,
  after_dig_node = function(pos)
    local ps1 = {x=pos.x-3, y=pos.y-1, z=pos.z}
    local pw1 = {x=pos.x+3, y=pos.y-1, z=pos.z}
    local pn1 = {x=pos.x, y=pos.y-1, z=pos.z-3}
    local pe1 = {x=pos.x, y=pos.y-1, z=pos.z+3}
    minetest.set_node(ps1,{name = 'illuminati:cone_off'})
    minetest.set_node(pw1,{name = 'illuminati:cone_off'})
    minetest.set_node(pn1,{name = 'illuminati:cone_off'})
    minetest.set_node(pe1,{name = 'illuminati:cone_off'})
  end,
})

minetest.register_node('illuminati:cone_off',{
  description = 'Power this brings.',
  drawtype = 'mesh',
  mesh = 'illuminati_core_cone.obj',
  tiles = {name='illuminati_cone.png'},
  groups = {cracky=2},
  paramtype = 'light',
  paramtype2 = 'facedir',
  selection_box = {
     type = 'fixed',
     fixed = {-.5, -.5, -.5, .5, .35, .5},
     },
  collision_box = {
     type = 'fixed',
     fixed = {-.5, -.5, -.5, .5, .35, .5},
     },
   after_place_node = function(pos, placer)
      local key = #(minetest.get_connected_players())
      local people = minetest.get_connected_players()
      local person = math.random(1, key)
      local name1 = people[person]
      local name = name1:get_player_name()
      local placer_name = placer:get_player_name()
      if name ~= placer_name then
         minetest.chat_send_player(name, send_message(illuminati.core_message_table))
      end
   end,

})

minetest.register_node('illuminati:cone_on',{
  description = 'Hackers should all die. :P', -- Actually just the black hat hackers.
  drawtype = 'mesh',
  mesh = 'illuminati_core_cone.obj',
  tiles = {name='illuminati_cone.png'},
  light_source = 13,
  groups = {not_in_creative_inventory=1},
  paramtype = 'light',
  paramtype2 = 'facedir',
  selection_box = {
     type = 'fixed',
     fixed = {-.5, -.5, -.5, .5, .35, .5},
     },
  collision_box = {
     type = 'fixed',
     fixed = {-.5, -.5, -.5, .5, .35, .5},
     },
})

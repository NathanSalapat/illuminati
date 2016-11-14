local illuminati_death_message_table = {
   '<Distant voice> We control your life too.',
   '<Hissing voice> Assemble the brotherhood, we have fresh flesh.',
   '<Whisper> The Illuminati claimed another life',
}


minetest.register_on_chat_message(function(name,message)
  if string.match(message, 'foobar') then
    minetest.chat_send_all('<Illuminati> Hush, this is not public information.')
  end
end)

minetest.register_on_chat_message(function(name,message)
  if string.match(message, '%p%p%p%p%p%p%p%p') then
    minetest.chat_send_player(name, '<Illuminati> Do you have a broken keyboard?')
  end
end)

--[[minetest.register_on_dieplayer(function(player)
   local key = #(minetest.get_connected_players())
   print ('number of people playing '..key)
   local person = math.random(1, key)
   for person,player in ipairs(minetest.get_connected_players()) do
	local name = player:get_player_name()
	minetest.chat_send_player(name, "Hello you fool, " .. name)
end
--   print (person_to_spook..' has been selected to get a cheery message.')
--   minetest.chat_send_player(person_to_spook, '<Illuminati> Somebody died.')
end)
--]]

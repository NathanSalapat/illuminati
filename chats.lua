local illuminati_death_message_table = {
   '<Distant voice> We control your life too.',
   '<Hissing voice> Assemble the brotherhood, we have fresh flesh.',
   '<Whisper> The Illuminati claimed another life',
   '<Faint voices in the breeze> That was an easy one.'
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

minetest.register_on_dieplayer(function(player)
   local key = #(minetest.get_connected_players())
   local people = minetest.get_connected_players()
   local person = math.random(1, key)
	local name1 = people[person]
   local name = name1:get_player_name()
	minetest.chat_send_player(name, "Hello " ..name..' somebody just died.')
end)

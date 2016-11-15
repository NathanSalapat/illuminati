illuminati.death_message_table = {
   '<Distant voice> We control your life too.',
   '<Hissing voice> Assemble the brotherhood, we have fresh flesh.',
   '<Whisper> The Illuminati claimed another life',
   '<Faint voices in the breeze> That was an easy one.',
}

illuminati.core_message_table = {
   'Ah, a new convert.',
   'Every day we grow in numbers.',
   'Has a mortal discovered our secret? Death to him!',
   'Blocks are but temporal, we are forever.',
}

function send_message(table)
   local max = #(table)
   local key = math.random(1,max)
   local message = table[key]
   return message
end

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
   if name1 ~= player then
      minetest.chat_send_player(name, send_message(illuminati.death_message_table))
   end
end)

illuminati.death_message_table = {
   '<Distant voice> We control your life too.',
   '<Hissing voice> Assemble the brotherhood, we have fresh flesh.',
   '<Whisper> The Illuminati claimed another life',
   '<Faint voices in the breeze> That was an easy one.',
   "<GrimpReaper> Fret not, I see you. I'm waching.",
}

illuminati.core_message_table = {
   '<Reptillian> Ah, a new convert.',
   '<Father> Every day we grow in numbers.',
   '<Saint> Has a mortal discovered our secret? Death to him!',
   '<Block_breaker> Blocks are but temporal, we are forever.',
}

illuminati.triangle_message_table = {
   "<Joe> this isn't good.",
   '<square_man_max> oh, are squares not good enough?',
   '<Joe> Three sides, three branches.',
   '<Joe> Three sides, three nails.', --Really not sure on this one...
   '<Joe> Heart, Brain, Body.',
   '<Joe> 3 corners 180 degrees.',
}

function send_message(table)
   local max = #(table)
   local key = math.random(1,max)
   local message = table[key]
   return message
end

function select_player(player, table)
   local key = #(minetest.get_connected_players())
   local people = minetest.get_connected_players()
   local person = math.random(1, key)
   local name1 = people[person]
   local name = player:get_player_name()
   if name1 ~= player then
      minetest.chat_send_player(name, send_message(table))
   end
end

minetest.register_on_dieplayer(function(player)
   select_player(player, illuminati.death_message_table)
end)

minetest.register_on_chat_message(function(name,message)
  if string.match(message, 'triangle') then
     minetest.chat_send_player(name, send_message(illuminati.triangle_message_table))
  end
end)

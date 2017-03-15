# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
#   @rune_index["data"].each do |id, rune|
#     @rune = Rune.create({
#       :rune_id => id,
#       :rune_name => rune["name"],
#       :rune_description => rune["description"],
#       :rune_image => rune["image"]["full"]
#     })
#   end

# require('httparty')

# --------GET GAME LIST API---------
# @game_array = []
#
# i = 1
# while i <= 20 do
#   @game_array.push((HTTParty.get "http://www.giantbomb.com/api/game/3030-#{i}/?api_key=cf71909f53e1497132eb781d7aab4d0936bfb352&format=json")["results"]["name"])
#   i+=1
# end
#
# for i in 0..@game_array.length
#   game = Gamesapi.create(name: @game_array[i])
# end
#
# @gamelist = HTTParty.get "http://www.giantbomb.com/api/games/?api_key=cf71909f53e1497132eb781d7aab4d0936bfb352&format=json&field_list=name&offset=100"

Game.create!([{ title: "Adsdsd666666sdsdxnt-Man", progress: "0"},
  {title: "1sdsdsdAntdsf-Ma666n", user_id: 1, progress: "0"},
  {title: "A2ntsdsd-dMan66", user_id: 1, progress: "0"},
  {title: "An3t-sdsdsd33Ma666n", user_id: 1, progress: "0"},
  {title: "Ant4---dMa666n", user_id: 1, progress: "0"},
  {title: "Ant-5--dd6666Man", user_id: 1, progress: "0"},
  {title: "Ant-Md--666an", user_id: 1, progress: "0"},
  {title: "Ant-Mda-766na", user_id: 1, progress: "0"},
  {title: "Ant-Mdd--an666a8", user_id: 1, progress: "0"},
  {title: "Ant-Mds8---aa66n", user_id: 1, progress: "0"},
  {title: "Ant-Mdsaadf666ffa8n", user_id: 1, progress: "0"},
  {title: "Ant-Mdaa83s6sdfffn", user_id: 1, progress: "0"},
  {title: "Ant-Masd3dfa668nd", user_id: 1, progress: "0"},
  {title: "Anaaat-3M3ddf65fddda8n", user_id: 1, progress: "0"},
  {title: "Aant-M3dar3r5ddrdssssf8n", user_id: 1, progress: "0"},
  {title: "aAnt-Msdrdd4aafss8n", user_id: 1, progress: "0"},
  {title: "Ant-Mddrasdddssaff8n", user_id: 1, progress: "0"},
  {title: "Ant-Mdaaa8ssrsrfsdn", user_id: 1, progress: "0"},
  {title: "Ant-Mada8fsddssrn", user_id: 1, progress: "0"},
  {title: "Ant-aMrdaffssfff8nr", user_id: 1, progress: "0"},
  {title: "Anta-Mfffrdassff8n", user_id: 1, progress: "0"},
  {title: "Anat-fMdaee8n", user_id: 1, progress: "0"},
  {title: "Aanfft-Mrrdeea8n", user_id: 1, progress: "0"},
  {title: "aAfnt-Mdcdeea8n", user_id: 1, progress: "0"}
])

puts 'Delete existing data'

Battle.destroy_all
Player.destroy_all

puts 'Create first 3 players'	

player = Player.new(
  name: 'Gandalf',
  strength_points: 2,
  intelligence_points: 6,
  magic_points: 7
)
player.remote_avatar_url = 'app/assets/images/gandalf.png'
player.save

player = Player.create(
  name: 'Aragorn',
  strength_points: 6,
  intelligence_points: 6,
  magic_points: 3
)
player.remote_avatar_url = 'app/assets/images/aragorn.png'
player.save

player = Player.create(
  name: 'Uruk Hai',
  strength_points: 8,
  intelligence_points: 3,
  magic_points: 4
)
player.remote_avatar_url = 'app/assets/images/uruk-hai.png'
player.save

player = Player.new(
  name: 'Legolas',
  strength_points: 5,
  intelligence_points: 5,
  magic_points: 5
)
player.remote_avatar_url = 'app/assets/images/legolas.png'
player.save

# puts "Created #{Player.count} players:
#   #{Player.first.name},
#   #{Player.second.name},
#   #{Player.third.name} and
#   #{Player.fourth.name} 👌"
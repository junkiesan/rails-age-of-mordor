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
player.remote_avatar_url = 'https://res.cloudinary.com/dxmeh3in0/image/upload/v1605621267/kyvm8zeitnpmdmpblabb.jpg'
player.save

player = Player.create(
  name: 'Aragorn',
  strength_points: 6,
  intelligence_points: 6,
  magic_points: 3
)
player.remote_avatar_url = 'https://res.cloudinary.com/dxmeh3in0/image/upload/v1605621269/kcbkoteaaifnrn6ibj1o.png'
player.save

player = Player.create(
  name: 'Uruk Hai',
  strength_points: 8,
  intelligence_points: 3,
  magic_points: 4
)
player.remote_avatar_url = 'https://res.cloudinary.com/dxmeh3in0/image/upload/v1605621270/ts6holuaxwmwi0155lwu.png'
player.save

player = Player.new(
  name: 'Legolas',
  strength_points: 5,
  intelligence_points: 5,
  magic_points: 5
)
player.remote_avatar_url = 'https://res.cloudinary.com/dxmeh3in0/image/upload/v1605621271/w12jbtsc0f0lsvdkuatf.jpg'
player.save

player = Player.new(
  name: 'Julien le Grand',
  strength_points: 10,
  intelligence_points: 1,
  magic_points: 3
)
player.remote_avatar_url = 'https://res.cloudinary.com/dxmeh3in0/image/upload/v1605621283/ecsf2u2lmcwikzj6qkuo.gif'
player.save

puts "Created #{Player.count} players:
  #{Player.first.name},
  #{Player.second.name},
  #{Player.third.name},
  #{Player.fourth.name} and
  #{Player.fifth.name} 👌"
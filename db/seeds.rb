# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
captains_power = Power.create(name: "Super Soldier")
irons_power = Power.create(name: "Powered Armor")
incredibles_power = Power.create(name: "Super Strength")
widows_power = Power.create(name: "Martial Arts")
bats_power = Power.create(name: "Expert Detective")
superms_power = Power.create(name: "Invulnerability")
aquas_power = Power.create(name: "Trident of Neptune")
superws_power = Power.create(name: "Lasso Of Submission")
magnetos_power = Power.create(name: "Magnetic Manipulation")
thanos_power = Power.create(name: "Infinity Gauntlet")
reds_power = Power.create(name: "Cosmic Cube")
mystiques_power = Power.create(name: "Shapeshift")
deathstrokes_power = Power.create(name: "Marksman")
jokers_power = Power.create(name: "Insanity")
lexs_power = Power.create(name: "Warsuit")
poisons_power = Power.create(name: "Deadly Touch")

captain_america = Hero.create(name: "Captain America")
captain_america.power = captains_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/marvel-clip-art-free-free-clipart-images.jpeg') do |f|
    captain_america.avatar = f
  end
captain_america.save

iron_man = Hero.create(name: "Iron Man")
iron_man.power = irons_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/220-2205651_iron-man-iron-man-flying-png-transparent-png.png') do |f|
  iron_man.avatar = f
end
iron_man.save

incredible_hulk = Hero.create(name: "Incredible Hulk")
incredible_hulk.power = incredibles_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/e7e1ba9cd159f4917d6befbf2d009bc1.jpg') do |f|
  incredible_hulk.avatar = f
end
incredible_hulk.save

black_widow = Hero.create(name: "Black Widow")
black_widow.power = widows_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/3-38432_blackwidow-natasharomanoff-comic-marvelcomics-marvel-marvel-black-widow.png') do |f|
  black_widow.avatar = f
end
black_widow.save

bat_man = Hero.create(name: "Batman")
bat_man.power = bats_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/13-137307_batman-comic-png-dc-comics-batman-new-52.png') do |f|
  bat_man.avatar = f
end
bat_man.save

super_man = Hero.create(name: "Superman")
super_man.power = superms_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/15-156846_superman-batman-drawing-superhero-image-cartoon-superman-hd.png') do |f|
  super_man.avatar = f
end
super_man.save

aqua_man = Hero.create(name: "Aquaman")
aqua_man.power = aquas_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/c4eac7ec6c790db3347d03e769071e5a.png') do |f|
  aqua_man.avatar = f
end
aqua_man.save

super_woman = Hero.create(name: "Superwoman")
super_woman.power = superws_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/385-3855167_its-what-people-expect-wonder-woman-comic-png.png.jpeg') do |f|
  super_woman.avatar = f
end
super_woman.save

magneto = Villain.create(name: "Magneto")
magneto.power = magnetos_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/548546.jpg') do |f|
  magneto.avatar = f
end
magneto.save

thanos = Villain.create(name: "Thanos")
thanos.power = thanos_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/8a160a417aaf22de8322a6f6b0dc211d.jpg') do |f|
  thanos.avatar = f
end
thanos.save

red_skull = Villain.create(name: "Red Skull")
red_skull.power = reds_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/49-497245_red-skull-marvel-xp-red-skull-marvel-white.png.jpeg') do |f|
  red_skull.avatar = f
end
red_skull.save

mystique = Villain.create(name: "Mystique")
mystique.power = mystiques_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/79-790191_mystique-marvel-xp-x-men-blue-body-paint.png.jpeg') do |f|
  mystique.avatar = f
end
mystique.save

deathstroke = Villain.create(name: "Deathstroke")
deathstroke.power = deathstrokes_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/70-709521_slade-wilson-53-batman-arkham-origins-deathstroke-png.png.jpeg') do |f|
  deathstroke.avatar = f
end
deathstroke.save

joker = Villain.create(name: "Joker")
joker.power = jokers_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/248-2481852_joker-joker-dc-comics-png-transparent-png.png') do |f|
  joker.avatar = f
end
joker.save

lex_luthor = Villain.create(name: "Lex Luthor")
lex_luthor.power = lexs_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/08LEXLUTHORBU11_CA_DCJLA_RED_04_1200x1200.jpg') do |f|
  lex_luthor.avatar = f
end
lex_luthor.save

poison_ivy = Villain.create(name: "Poison Ivy")
poison_ivy.power = poisons_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/d5uy5fc-23df9b62-c6bb-490f-87d4-54334162cc25.jpg') do |f|
  poison_ivy.avatar = f
end
poison_ivy.save


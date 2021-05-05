# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#starter hero
captains_power = Power.create(name: "Super Soldier")
captain_america = Hero.create(name: "Captain America")
captain_america.power = captains_power
File.open('/Users/nathanhains/Development/code/phase3/allegience/allegience/app/assets/images/marvel-clip-art-free-free-clipart-images.jpeg') do |f|
    captain_america.avatar = f
  end
captain_america.save

#story
power_savior = Power.create(name: "Power of the Savior")
power_conquerer = Power.create(name: "Power of the Conquerer")
divinitys_past = Power.create(name: "Divinity's Past")
sins_future = Power.create(name: "Sin's Future")
heros_wrath = Power.create(name: "Hero's Wrath")
evils_brutality = Power.create(name: "Evil's Brutality")
heart_of_gold = Power.create(name: "Heart of Gold")
shadow_of_absolution= Power.create(name: "Shadow of Absolution")
nobles_armor= Power.create(name: "Noble's Armor")
tyrannys_solitude = Power.create(name: "Tyranny's Solitude")
ressurection = Power.create(name: "Ressurection")
eternal_infamy = Power.create(name: "Eternal Infamy")
powers_array = [power_savior, power_conquerer, divinitys_past, sins_future, heros_wrath, evils_brutality, heart_of_gold, shadow_of_absolution, nobles_armor, tyrannys_solitude, ressurection, eternal_infamy]
starter = User.create(username: "Allegiance", email:"nathanhains14@yahoo.com", password: "dontguess")
starter.civilian = Civilian.create(user_id: starter.id, name: starter.alter_ego, avatar: starter.avatar)
heroization = Heroization.create(user_id: starter.id, hero_id: 1)
starter.save

#saving all powers for later use
powers_array.each do |power|
  heroization.powers << power
end

tutorial_1 = Job.create(requestor_user_id: starter.id, title: "Tutorial: Civilians", description: "Welcome to Allegiance!
  Civilians - 
  Upon creation, you were equipped with a civilian character which you will be granted access to create side missions for the Heroes and Villains of the world! At level 2, you will be able to join Civilian Factions where you can interact with other civilians! To level up, civilians earn 5 points per side mission post. Post some up now!", requirement: 0, reward: 5)
tutorial_2 = Job.create(requestor_user_id: starter.id, title: "Tutorial: Powered", description: "Powered-
  Selecting a hero/villain allows users to defend/ wreck havoc in the world! Simply put, you will be able to save/conquer other civilian's side missions. Each Hero/Villain is equipped with a default power. As you complete the story mode, you will gain new powers for your individual powered characters. To meet requirements for Story Chapters/ Side Missions, you will have to increase your powered rank which you do so by completing missions that match your level. At level 3, you will be able to join Hero/ Villain factions which you will be able to interact with other powered individuals! Follow through to the end of the story mode to collect all the powers! Have Fun!", requirement: 0, reward: 5)

chapter_1 = Job.create(requestor_user_id: starter.id, title: "Chapter 1", description: "The world has split in two. The ongoing battle for supremecy between Heroes and Villains has reached an all time high of destruction. Among the chaos, a light has shone through to the islands of San-Pier Pacific calling for your name. Will you accept the call?", requirement: 1, reward: 5, power_reward_hero: power_savior.name, power_reward_villain: power_conquerer.name)
chapter_2 = Job.create(requestor_user_id: starter.id, title: "Chapter 2", description: "Upon arrival, the light of San-Pier Pacific grew ever-bright. Sifting through the palm trees, you learn the object of which the light shines is but an artifiact who's presence casts a feeling of finality. This artifact's true nature is unknown to you, yet, you feel a drive to take possession, releasing this mystical metal from it's constraints. You ponder the thought.", requirement: 2, reward: 5, power_reward_hero: divinitys_past.name, power_reward_villain: sins_future.name)
chapter_3 = Job.create(requestor_user_id: starter.id, title: "Chapter 3", description: "You awake to a window, detailing a cloudey Summer day. Familiarity overwhelms your body as the realization that your apartment, long destroyed, surrounds you. The daily news reports that the current date is 5 years previous. The day it all began. A sesation takes you out of the initial shock to reveal the object of which called upon your name, has infused within the palm of your hand! Looking up you hear the news reporter reveal the source of the blackouts has been identified. Recalling the events soon to unfold, you collect yourself to determine the next coure of action.", requirement: 3, reward: 5, power_reward_hero: heros_wrath.name, power_reward_villain: evils_brutality.name)
chapter_4 = Job.create(requestor_user_id: starter.id, title: "Chapter 4", description: "Suited up and in pursuite, the thoughts of loved one's since passed, buildings reformed and the fate of the world are put on pause as you are knocked off course. Time fractions into slow, methodical fragments. You take notice of your heartbeat, now non existent along with any surrounding movement when suddenly the projectile comes into view. Now split in two, one fragment is heading straight for a family of two while the other, an entrusted Nowgo bank. You attempt to move as time suddenly shifts back into motion, speeding up like cogs in a machine. Time releases you of your constraints to make your move.", requirement: 5, reward: 5, power_reward_hero:heart_of_gold.name , power_reward_villain: shadow_of_absolution.name)
chapter_5 = Job.create(requestor_user_id: starter.id, title: "Chapter 5", description: "The source of the projcetile looms over the sky, casting a shadow across the town. A voice then echoes and ricochets between your temples calling to return the artifact you have stolen. Your hand begins to resonate and glow as you take balance, your boding forming stance like muscle memory. Projectiles are hurdling towards you like a mist of shards as you aim your palm vertically towards the figure. You pause to contemplate the reality of the situation.", requirement: 7, reward: 5, power_reward_hero: nobles_armor.name, power_reward_villain: tyrannys_solitude.name)
chapter_6 = Job.create(requestor_user_id: starter.id, title: "Chapter 6", description: "Helicopter thuds, screams of terror, and police sirens all ring through the air like a harmonious nightmare. Lights flicker as the sun fleets and the building surrounded by military, pulsates with energy. Time slows again but your movement remains. Recollection of the crater flashes to the front of your mind only to retreat back to the depths again. The corridors of the building seem to guide you as the emptied labs pass you by. Silence. Darkness. A single light shines in the middle of a highly guarded cage. A mirror image of the object within your palm sits wihtin,  radiating with energy despite the crushing silence of time paused. You get a familiar feeling of finality but this time you finally understand why. With your newfound powers, you have the choice to absorb the blast, sacrificing yourself for the longevity of humanity, or turn your back and seize the opportunities of foresight. The artifact pulsates as you open the cage.", requirement: 9, reward: 5, power_reward_hero: ressurection.name, power_reward_villain:eternal_infamy.name)

#roster
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


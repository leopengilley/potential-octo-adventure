User.destroy_all
u1 = User.create :name => 'Ash', :password => 'chicken', :admin => true
u2 = User.create :name => 'Misty', :password => 'chicken'
u3 = User.create :name => 'Brock', :password => 'chicken'
puts "#{ User.count } users."


Bag.destroy_all
b1 = Bag.create :title => 'Early game'
b2 = Bag.create :title => 'Mid game'
b3 = Bag.create :title => 'End game'
puts "#{ Bag.count } bags."

Pokemon.destroy_all
p1 = Pokemon.create :name => 'pikachu'
p2 = Pokemon.create :name => 'charmander'
p3 = Pokemon.create :name => 'bulbasaur'
p4 = Pokemon.create :name => 'squirtle'
p5 = Pokemon.create :name => 'charmeleon'
p6 = Pokemon.create :name => 'ivysaur'
p7 = Pokemon.create :name => 'wartortle'
p8 = Pokemon.create :name => 'charizard'
p9 = Pokemon.create :name => 'venusaur'
p10 = Pokemon.create :name => 'blastoise'
puts "#{ Pokemon.count } pokemons."

Attack.destroy_all
a1 = Attack.create :name => 'static', :damage => 5
a2 = Attack.create :name => 'blaze', :damage => 5
a3 = Attack.create :name => 'chlorophyll', :damage => 5
a4 = Attack.create :name => 'torrent', :damage => 5
a5 = Attack.create :name => 'solar-power', :damage => 5
a6 = Attack.create :name => 'overgrow', :damage => 5
a7 = Attack.create :name => 'rain-dish', :damage => 5
a8 = Attack.create :name => 'growl', :damage => 5
a9 = Attack.create :name => 'petal-blizzard', :damage => 5
a10 = Attack.create :name => 'bubble-beam', :damage => 5
a11 = Attack.create :name => 'hydro-pump', :damage => 5
a12 = Attack.create :name => 'flamethrower', :damage => 5
puts "#{ Attack.count } attacks."

#Associations

puts "Bags and Pokemons"
b1.pokemons << p1 << p2 << p3 << p4
b2.pokemons << p5 << p6 << p7
b3.pokemons << p8 << p9 << p10

puts "Pokemons and Attacks"
p1.attacks << a1
p2.attacks << a2
p3.attacks << a3
p4.attacks << a4
p5.attacks << a5
p6.attacks << a6
p7.attacks << a7
p8.attacks << a12 << a8
p9.attacks << a9
p10.attacks << a11 << a10

puts "Users and Bags"
u1.bags << b1
u2.bags << b2
u3.bags << b3

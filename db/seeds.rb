require 'faker'

# Seed Users

noah = User.create(first_name: "Noah", last_name: "Schutte", email: "noahschutte@gmail.com", phone: "6023016624", password: "noah")
theo = User.create(first_name: "Theo", last_name: "Paul", email: "theo@theinstillery.com", phone: "9293348660", password: "theo")
dan = User.create(first_name: "Dan", last_name: "Homer", email: "daniel.homer6@gmail.com", phone: "3022427822", password: "dan")
esther = User.create(first_name: "Esther", last_name: "Allred", email: "eallred@gmail.com", phone: "2028213056", password: "esther")
cooper = User.create(first_name: "Cooper", last_name: "Asay", email: "casay@gmail.com", phone: "3025317433", password: "cooper")
gloria = User.create(first_name: "Gloria", last_name: "Homer", email: "gwhomer@yahoo.com", phone: "3022706494", password: "gloria")
jerry = User.create(first_name: "Jerry", last_name: "Homer", email: "jerry.homer24@gmail.com", phone: "9195256448", password: "jerry")
cat = User.create(first_name: "Cat", last_name: "Luo", email: "catharine.luo@gmail.com", phone: "4047024422", password: "cat")
alex = User.create(first_name: "Alex", last_name: "Homer", email: "realalexhomer@gmail.com", phone: "3022331673", password: "alex")
james = User.create(first_name: "James", last_name: "Allred", email: "james@gmail.com", phone: "8043101925", password: "james")
camden = User.create(first_name: "Camden", last_name: "Asay", email: "camden@gmail.com", phone: "3025315888", password: "camden")
marge = User.create(first_name: "Marge", last_name: "Creaser", email: "marge@gmail.com", phone: "2073330354", password: "marge")
danny = User.create(first_name: "Danny", last_name: "Heiber", email: "danny@gmail.com", phone: "5408140305", password: "danny")
jacob = User.create(first_name: "Jacob", last_name: "Hill", email: "jacob@gmail.com", phone: "7572542179", password: "jacob")
dustin = User.create(first_name: "Dustin", last_name: "Hillsley", email: "dustin@gmail.com", phone: "3039164564", password: "dustin")
lindsay = User.create(first_name: "Lindsay", last_name: "Homer", email: "lindsay@gmail.com", phone: "9177044238", password: "lindsay")
angela = User.create(first_name: "Angela", last_name: "Jones", email: "angela@gmail.com", phone: "7818598863", password: "angela")
shaun = User.create(first_name: "Shaun", last_name: "Kelly", email: "shaun@gmail.com", phone: "3022995492", password: "shaun")
martin = User.create(first_name: "Martin", last_name: "Kim", email: "martin@gmail.com", phone: "3126362922", password: "martin")
missy = User.create(first_name: "Missy", last_name: "Louie", email: "missy@gmail.com", phone: "3022224628", password: "missy")
brenda = User.create(first_name: "Brenda", last_name: "Luo", email: "brenda@gmail.com", phone: "4048891871", password: "brenda")
mac = User.create(first_name: "Mac", last_name: "Measley", email: "mac@gmail.com", phone: "3022902535", password: "mac")
kevin = User.create(first_name: "Kevin", last_name: "Perkins", email: "kevin@gmail.com", phone: "5134040792", password: "kevin")
john = User.create(first_name: "John", last_name: "Schwartz", email: "john@gmail.com", phone: "9148266138", password: "john")
thomas = User.create(first_name: "Thomas", last_name: "Will", email: "thomas@gmail.com", phone: "3362624705", password: "thomas")

 # Prompts lists

selfies_prompts = [
  "Picture: your duckface",
  "Picture: your fly self",
  "Picture: your new outfit",
  "Picture: your goofy self",
  "Picture: you and your grub",
  "Picture: you and your squad"
]

in_character_prompts = [
  "Picture your best: Zoolander",
  "Picture your best: Batman",
  "Picture your best: Pirate",
  "Picture your best: Fonzie",
  "Picture your best: Spiderman"
]

scavenger_hunt_prompts = [
  "Find something: exotic",
  "Find something: unique",
  "Find something: repulsive",
  "Find something: frightening",
  "Find something: edgy"
]

act_it_out_prompts = [
  "Act it Out: Handstand",
  "Act it Out: Plank",
  "Act it Out: Bust a move",
  "Act it Out: Heisman"
]

pet_pics_prompts = [
  "Picture your pet: excited",
  "Picture your pet: chillin",
  "Picture your pet: curious",
  "Picture your pet: sleepy",
  "Picture your pet: begging"
]

the_great_outdoors_prompts = [
  "Picture: a sunset",
  "Picture: a landmark",
  "Picture: the skyline",
  "Picture: greenery"
]

# Seed Decks

deck1 = Deck.create(name: "Selfies")
deck2 = Deck.create(name: "In Character")
deck3 = Deck.create(name: "Scavenger Hunt")
deck4 = Deck.create(name: "Act it Out")
deck5 = Deck.create(name: "Pet Pics")
deck6 = Deck.create(name: "The Great Outdoors")

# Seed Prompts

selfies_prompts.length.times do |i|
  Prompt.create(body: selfies_prompts[i], deck_id: 1)
end

in_character_prompts.length.times do |i|
  Prompt.create(body: in_character_prompts[i], deck_id: 2)
end

scavenger_hunt_prompts.length.times do |i|
  Prompt.create(body: scavenger_hunt_prompts[i], deck_id: 3)
end

the_great_outdoors_prompts.length.times do |i|
  Prompt.create(body: act_it_out_prompts[i], deck_id: 4)
end

pet_pics_prompts.length.times do |i|
  Prompt.create(body: pet_pics_prompts[i], deck_id: 5)
end

act_it_out_prompts.length.times do |i|
  Prompt.create(body: the_great_outdoors_prompts[i], deck_id: 6)
end

# Seed Open Rounds

round1 = Round.create(creator_id: noah.id, prompt_id: 7, end_time: DateTime.now + 4.days)
round1.participants << noah
round1.participants << theo
round1.participants << dan

round2 = Round.create(creator_id: theo.id, prompt_id: 19, end_time: DateTime.now + 4.days)
round2.participants << noah
round2.participants << theo
round2.participants << dan

round3 = Round.create(creator_id: dan.id, prompt_id: 23, end_time: DateTime.now + 4.days)
round3.participants << noah
round3.participants << theo
round3.participants << dan

# Seed Closed Rounds

round1 = Round.create(creator_id: noah.id, prompt_id: 4, end_time: DateTime.now - 1.days)
round1.participants << noah
round1.participants << theo
round1.participants << dan

round2 = Round.create(creator_id: theo.id, prompt_id: 22, end_time: DateTime.now - 1.days)
round2.participants << noah
round2.participants << theo
round2.participants << dan

round3 = Round.create(creator_id: dan.id, prompt_id: 27, end_time: DateTime.now - 1.days)
round3.participants << gloria
round3.participants << jerry
round3.participants << alex
round3.participants << dan


#  ## Randos
# 17.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   full_name = "#{first_name} #{last_name}"
#   User.create(first_name: first_name, last_name: last_name, email:Faker::Internet.email(full_name), phone: random_phone_number, password:"#{first_name.downcase}")
# end
#
#  # Rounds Seed
# def closed_round(time_ago = 15)
#   return DateTime.now - "#{time_ago}".to_i.days
# end
#
# def open_round(time_ahead = 15)
#   return DateTime.now + "#{time_ahead}".to_i.days
# end
#
# def random_user
#   User.all.sample
# end
#
# def random_admin
#   theo = User.find_by(first_name: 'Theo')
#   noah = User.find_by(first_name: 'Noah')
#   dan = User.find_by(first_name: 'Dan')
#   return [theo, noah, dan].sample
# end
#
# def add_user_to_round(round, user)
#   if round.participants.include?(user)
#     add_user_to_round(round, random_user)
#   else
#     round.participants.push(user)
#   end
# end
#
# def add_creator_to_round(round, creator)
#   add_user_to_round(round, creator)
# end
#
# def add_admin_to_round(round, admin)
#   add_user_to_round(round, admin)
# end
#
# def create_random_participants(round)
#   rand(1..4).times do
#     add_user_to_round(round, random_user)
#   end
# end
#
# Prompt.all.each do |prompt|
#   creator = random_user
#   round = Round.create(creator_id: creator.id, prompt_id: prompt.id, end_time: [closed_round, open_round].sample)
#   add_creator_to_round(round, creator)
#   add_admin_to_round(round, random_admin)
#   create_random_participants(round)
# end
#
# def random_prompt(prompts)
#   prompt = prompts.sample
#   if Prompt.find_by(body: prompt)
#     random_prompt(prompts)
#   else
#     return prompt
#   end
# end
#
#
# def random_phone_number
#   "#{random_number(3)}#{random_number(3)}#{random_number(4)}"
# end
#
# def random_number(digits)
#   number = []
#   digits.times do
#     number << rand(10)
#   end
#   return number.join('')
# end

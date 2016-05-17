require 'faker'


def random_prompt(prompts)
  prompt = prompts.sample
  if Prompt.find_by(body: prompt)
    random_prompt(prompts)
  else
    return prompt
  end
end

# Decks seed

deck1 = Deck.create(name: "Selfies")
deck2 = Deck.create(name: "In Character")
deck3 = Deck.create(name: "Scavenger Hunt")
deck4 = Deck.create(name: "Act it Out")
deck5 = Deck.create(name: "Pet Pics")
deck6 = Deck.create(name: "The Great Outdoors")

 # Prompts lists

selfies_prompts = [
  "Picture: your duckface",
  "Picture: yourself looking fly",
  "Picture: your new outfit",
  "Picture: yourself at your goofiest",
  "Picture: yourself chowin' down",
  "Picture: yourself with your squad"
]

in_character_prompts = [
  "Picture your best: Zoolander",
  "Picture your best: Batman",
  "Picture your best: Pirate",
  "Picture your best: Michael Jackson",
  "Picture your best: Spiderman"
]

scavenger_hunt_prompts = [
  "What's That Smell",
  "Next Greatest Trend",
  "Next Best Thing",
  "Inspiration Du Jour"
]

the_great_outdoors_prompts = [
  "Landmark",
  "Scenery",
  "Sunrise/Sunset"
]

pets_prompts = [
  "Take a Cute Photo of your pet",
  "Take a photo of your pet Chillin'",
  "Take a photo of your pet Playing with its favourite toy"
]

act_it_out_prompts = [
  "Take a picture of a Dab!",
  "Take a picture of a Handstand!",
  "Take a picture of a Star jump!"
]

# Prompts Seed
selfies_prompts.length.times do
  Prompt.create!(body: random_prompt(selfies_prompts), deck_id: 1) # Do I have to randomly populate the decks with prompts? Something to consider. Alternatievly I could just call .pop on the container of prompts.
end

in_character_prompts.length.times do
  Prompt.create(body: random_prompt(in_character_prompts), deck_id: 2)
end

scavenger_hunt_prompts.length.times do
  Prompt.create(body: random_prompt(scavenger_hunt_prompts), deck_id: 3)
end

the_great_outdoors_prompts.length.times do
  Prompt.create(body: random_prompt(the_great_outdoors_prompts), deck_id: 4)
end

pets_prompts.length.times do
  Prompt.create(body: random_prompt(pets_prompts), deck_id: 5)
end

act_it_out_prompts.length.times do
  Prompt.create(body: random_prompt(act_it_out_prompts), deck_id: 6)
end

# Users seeds

 ## Admins

noah = User.create(first_name: "Noah", last_name: "Schutte", email: "noah@email.com", phone: "6023016624", password: "noah")
theo = User.create(first_name: "Theo", last_name: "Paul", email: "theo@email.com", phone: "9293348660", password: "theo")
dan = User.create(first_name: "Dan", last_name: "Homer", email: "dan@email.com", phone: "3022427822", password: "dan")

def random_phone_number
  "#{random_number(3)}#{random_number(3)}#{random_number(4)}"
end

def random_number(digits)
  number = []
  digits.times do
    number << rand(10)
  end
  return number.join('')
end

 ## Randos
17.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  full_name = "#{first_name} #{last_name}"
  User.create(first_name: first_name, last_name: last_name, email:Faker::Internet.email(full_name), phone: random_phone_number, password:"#{first_name.downcase}")
end

 # Rounds Seed
def closed_round(time_ago = 15)
  return DateTime.now - "#{time_ago}".to_i.days
end

def open_round(time_ahead = 15)
  return DateTime.now + "#{time_ahead}".to_i.days
end

def random_user
  User.all.sample
end

def random_admin
  theo = User.find_by(first_name: 'Theo')
  noah = User.find_by(first_name: 'Noah')
  dan = User.find_by(first_name: 'Dan')
  return [theo, noah, dan].sample
end

def add_user_to_round(round, user)
  if round.participants.include?(user)
    add_user_to_round(round, random_user)
  else
    round.participants.push(user)
  end
end

def add_creator_to_round(round, creator)
  add_user_to_round(round, creator)
end

def add_admin_to_round(round, admin)
  add_user_to_round(round, admin)
end

def create_random_participants(round)
  rand(1..4).times do
    add_user_to_round(round, random_user)
  end
end

Prompt.all.each do |prompt|
  creator = random_user
  round = Round.create(creator_id: creator.id, prompt_id: prompt.id, end_time: [closed_round, open_round].sample)
  add_creator_to_round(round, creator)
  add_admin_to_round(round, random_admin)
  create_random_participants(round)
end

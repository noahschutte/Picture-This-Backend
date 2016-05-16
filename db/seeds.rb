require 'faker'

prompts = [
  "rapid",
  "miscreant",
  "dreary",
  "jolly",
  "three",
  "possessive",
  "solid",
  "bustling",
  "dead",
  "nippy",
  "hilarious",
  "breakable",
  "lucky",
  "electric",
  "earthy",
  "elated" ]

def random_prompt(prompts)
  prompts.shuffle
  return prompts.pop
end

noah = User.create(first_name: "Noah", last_name: "Schutte", email: "noah@email.com", phone: "6023016624", password: "noah")
theo = User.create(first_name: "Theo", last_name: "Paul", email: "theo@email.com", phone: "7654321", password: "theo")
dan = User.create(first_name: "Dan", last_name: "Homer", email: "dan@email.com", phone: "7777777", password: "dan")

Deck.create(name: "Family")
Deck.create(name: "Friends")
Deck.create(name: "Frenemies")

# Prompts Seed
5.times do
  Prompt.create(deck_id: 1, body: random_prompt(prompts))

end
5.times do
  Prompt.create!(deck_id: 2, body: random_prompt(prompts))
end

5.times do
  Prompt.create(deck_id: 3, body: random_prompt(prompts))
end

# [1,2,3,4,5].each do |num|
#   round = Round.create(creator_id: 1 + rand(3), prompt_id: 1 + rand(15), end_time: DateTime.now - 15)
#   round.participants << noah
#   round.participants << theo
#   round.participants << dan
# end
#
# [1,2,3,4,5].each do |num|
#   round = Round.create(creator_id: 1 + rand(3), prompt_id: 1 + rand(15), end_time: DateTime.now + 15)
#   round.participants << noah
#   round.participants << theo
#   round.participants << dan
# end

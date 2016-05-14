noah = User.create(first_name: "Noah", last_name: "Schutte", email: "noah@email.com", phone: "6023016624", password: "noah")
theo = User.create(first_name: "Theo", last_name: "Paul", email: "theo@email.com", phone: "7654321", password: "theo")
dan = User.create(first_name: "Dan", last_name: "Homer", email: "dan@email.com", phone: "7777777", password: "dan")

Deck.create(name: "Family")
Deck.create(name: "Friends")
Deck.create(name: "Frenemies")

[1,2,3].each do |deck|
  [1,2,3,4,5].each do |num|
    Prompt.create(deck_id: deck, body: "#{rand(999)}")
  end
end

[1,2,3,4,5].each do |num|
  Round.create(creator_id: 1 + rand(3), prompt_id: 1 + rand(15), end_time: DateTime.now)
  round1 = Round.find_by(id: num)
  round1.participants << noah
  round1.participants << theo
  round1.participants << dan
end

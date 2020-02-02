require './lib/round.rb'
require './lib/turn.rb'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/card_generator.rb'

filename = "cards.txt"
cards = CardGenerator.new(filename)
file_cards = cards.file_cards

deck = Deck.new(file_cards)
round = Round.new(deck)

round.start

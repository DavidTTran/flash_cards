require './lib/round.rb'
require './lib/turn.rb'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/card_generator.rb'

# card_1 = Card.new("What is 5 + 5?", "10", :STEM)
# card_2 = Card.new("What is Rachel's favorite animal?", "red panda", "Turing Staff")
# card_3 = Card.new("What is Mike's middle name?", "nobody knows", "Turing Staff")
# card_4 = Card.new("What cardboard cutout lives at Turing?", "justin bieber", "Pop Culture")

# cards = [card_1, card_2, card_3, card_4]
filename = "cards.txt"
cards = CardGenerator.new(filename)
file_cards = cards.file_cards

deck = Deck.new(file_cards)
round = Round.new(deck)

round.start

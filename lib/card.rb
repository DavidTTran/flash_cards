class Card
  attr_reader :question, :answer, :category

  def initialize(question, answer, category)
    @question = question
    @answer = answer
    @category = category
  end
end




# # double check that you are in your flashcards project directory!
# pry(main)> require './lib/card'
# #=> true
#
# pry(main)> card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
# #=> #<Card:0x00007f800e29f0c8 @question=""What is the capital of Alaska?", @answer="Juneau", @category=:Geography>
#
# pry(main)> card.question
# #=> "What is the capital of Alaska?"
#
# pry(main)> card.answer
# #=> "Juneau"
#
# pry(main)> card.category
# #=> :Geography

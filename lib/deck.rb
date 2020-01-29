class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.count
  end

  def cards_in_category(category)
    sorted_array = []
    @cards.each do |card|
      if card.category == category
      sorted_array << card
      end
    end
    sorted_array
  end
end

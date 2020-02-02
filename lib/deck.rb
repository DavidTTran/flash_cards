class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.size
  end

  def cards_in_category(category)
    sorted_by_category = []
    @cards.each do |card|
      if card.category == category
      sorted_by_category << card
      end
    end
    sorted_by_category
  end


end

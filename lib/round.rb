class Round
  attr_reader :deck, :turns, :number_correct, :correct_by_category

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @correct_by_category = 0
  end

  def current_card
    @deck.cards[0]
  end

  def take_turn(guess)
    turn = Turn.new(guess, current_card)
    @number_correct += 1 unless turn.correct? != true
    @turns << turn
    @deck.cards.shift()
    turn
  end

  def number_correct_by_category(category)
    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        @correct_by_category += 1
      end
    end
    correct_by_category
  end

  def percent_correct
    (@number_correct.to_f / @turns.size) * 100
  end
end

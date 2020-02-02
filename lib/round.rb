class Round
  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @total_number_of_cards = 0
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
    correct_by_category = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct? == true
        correct_by_category += 1
      end
    end
    correct_by_category
  end

  def cards_in_category(category)
    sorted_by_category = []
    @turns.each do |turn|
      if turn.card.category == category
      sorted_by_category << turn.card
      end
    end
    sorted_by_category
  end

  def percent_correct
    (@number_correct.to_f / @turns.size) * 100
  end

  def start
    card_counter = 1
    total_number_of_cards = deck.count

    puts "Welcome! You're playing with #{deck.count} cards."

    while @turns.count != total_number_of_cards
      puts "-" * 50
      puts "This is card number #{card_counter} out of #{total_number_of_cards}."
      puts "Question: #{current_card.question}"
      guess = gets.chomp.downcase
      take_turn(guess)
      @turns.last.feedback
    end
    puts ("-" * 20) + "Game over!" + ("-" * 20)
    puts "You had #{@number_correct} correct guesses out of #{total_number_of_cards} for a total score of #{percent_correct}%."

    puts "STEM - #{(number_correct_by_category("STEM").to_f / cards_in_category("STEM").count) * 100}% correct"

    puts "Turing Staff - #{(number_correct_by_category("Turing Staff").to_f / cards_in_category("Turing Staff").count) * 100}% correct"

    puts "Pop Culture - #{(number_correct_by_category("Pop Culture").to_f / cards_in_category("Pop Culture").count) * 100}% correct"
  end
end

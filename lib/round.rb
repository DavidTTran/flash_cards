class Round
  attr_reader :deck, :turns, :number_correct, :correct_by_category, :total_number_of_cards

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
    @correct_by_category = 0
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
    @turns.each do |turn|
      if turn.card.category == category && turn.correct? == true
        @correct_by_category += 1
      end
    end
    correct_by_category
  end

  def percent_correct
    (@number_correct.to_f / @turns.size) * 100
  end

  def start
    card_counter = 1
    puts "Welcome! You're playing with #{deck.count} cards."
    total_number_of_cards = deck.count

    while @turns.count != total_number_of_cards
      puts "-" * 50
      puts "This is card number #{card_counter} out of #{total_number_of_cards}."
      puts "Question: #{@deck.cards[0].question}"
      guess = gets.chomp.downcase
      if guess == @deck.cards[0].answer
        puts "Correct!"
        card_counter += 1
      else
        puts "Incorrect."
        card_counter += 1
      end
      take_turn(guess)
    end
    puts ("-" * 20) + "Game over!" + ("-" * 20)
    puts "You had #{@number_correct} correct guesses out of #{total_number_of_cards} for a total score of #{percent_correct}%."

  end
end

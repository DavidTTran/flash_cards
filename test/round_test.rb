require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck.rb'
require './lib/card.rb'
require './lib/round.rb'
require './lib/turn.rb'
require 'pry'

class RoundTest < Minitest::Test
  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars", :STEM)
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west", :STEM)
    @deck = Deck.new([@card_1, @card_2, @card_3])
    @round = Round.new(@deck)
  end

  def test_turns_rounds_methods
    assert_equal [], @round.turns
    assert_equal @card_1, @round.current_card
    assert_instance_of Round, @round
  end

  def test_take_turn
    new_turn = @round.take_turn("Juneau")
    assert_equal "Juneau", new_turn.guess
    assert_equal @card_1, new_turn.card
    assert_equal :Geography, new_turn.card.category
  end

  def test_new_turn_class
    new_turn = @round.take_turn("Juneau")
    assert_equal Turn, new_turn.class
    assert_equal true, new_turn.correct?
  end

  def test_new_turn_attributes
    new_turn = @round.take_turn("Juneau")
    assert_equal [new_turn], @round.turns
    assert_equal 1, @round.number_correct
    assert_equal @card_2, @round.current_card
  end

  def test_turns_count
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 2, @round.turns.count
  end

  def test_last_turn_incorrect
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal "Incorrect.", @round.turns.last.feedback
    assert_equal 1, @round.number_correct
  end

  def test_number_correct_by_category
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 1, @round.number_correct_by_category(:Geography)
    assert_equal 0, @round.number_correct_by_category(:STEM)
  end

  def test_percent_correct
    @round.take_turn("Juneau")
    @round.take_turn("Venus")
    assert_equal 50.0, @round.percent_correct
  end
end

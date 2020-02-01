require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn.rb'
require './lib/card.rb'

class TurnTest < Minitest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau", :Geography)
    @turn = Turn.new("Juneau", @card)
  end

  def test_it_exists
    assert_instance_of Turn, @turn
  end

  def test_turn_card_attributes
    assert_equal @card, @turn.card
    assert_equal "Juneau", @turn.guess
  end

  def test_guess_is_correct?
    assert_equal true, @turn.correct?
    assert_equal "Correct!", @turn.feedback
  end

  def test_guess
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)

    assert_equal "Saturn", turn.guess
  end

  def test_incorrect_guess
    card = Card.new("Which planet is closest to the sun?", "Mercury", :STEM)
    turn = Turn.new("Saturn", card)
    assert_equal false, turn.correct?
    assert_equal "Incorrect.", turn.feedback
  end
end

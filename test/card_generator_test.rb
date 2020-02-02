require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < Minitest::Test

  def test_it_exists
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    assert_instance_of CardGenerator, cards
  end

  def test_create_card_from_file
    filename = "cards.txt"
    cards = CardGenerator.new(filename)
    assert_equal 4, cards.file_cards.size
  end
end

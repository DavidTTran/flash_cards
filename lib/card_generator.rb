class CardGenerator
  attr_reader :cards, :filename

  def initialize(filename)
    @cards = cards
    @filename = filename
  end

  def file_cards
    lines = []
    deck = []
    File.readlines(@filename).each do |line|
      lines << line.chomp.split(',')
    end
    until lines.size == 0
      deck << Card.new(lines.first[0], lines.first[1], lines.first[2])
      lines.shift
    end
    deck
  end
end

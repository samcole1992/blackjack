class Deck
  SUITS = ['♦', '♣', '♠', '♥']
  RANKS = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

  attr_accessor :cards

  def initialize
    @cards = deck_setup
  end

  def deck_setup
    cards = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        cards << Card.new("#{rank}", "#{suit}")
      end
    end
    cards.shuffle!
  end

  def deal(num)
    cards.pop(num)
  end
end

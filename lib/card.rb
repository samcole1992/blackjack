class Card
  # Your code here
  attr_reader :rank, :suit, :value
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    @value = value_calculator
  end

  def value_calculator
    @value = @rank.gsub(/[JQK]/, '10').to_i
  end
end

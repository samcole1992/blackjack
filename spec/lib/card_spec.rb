require "spec_helper"

RSpec.describe Card do
  # Your tests here
  describe "#initialize" do
    it "makes a card with a value and a suit input and creates a 'value'" do
      card = Card.new('8','♥')
      expect(card.rank).to eq('8')
      expect(card.suit).to eq('♥')
      expect(card.value).to eq(8)
    end
  end
end

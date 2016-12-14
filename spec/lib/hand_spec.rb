require "spec_helper"

RSpec.describe Hand do
  # Your tests here
  describe "#initalize" do
    hand = Hand.new()
    it "should have a sum of zero" do
      expect(hand.sum).to eq(0)
    end
    it "should not have any cards" do
      expect(hand.cards).to eq([])
    end
  end

  describe "#get_card" do
    sean_hand = Hand.new()
    sam_hand = Hand.new()
    deck = Deck.new()
    it "should get one card from the deck every time it is prompted" do
      sean_hand.get_card(deck.deal(1))
      sam_hand.get_card(deck.deal(2))

      expect(sean_hand.cards.size).to eq(1)
      expect(sam_hand.cards.size).to eq(2)
    end
  end

  describe "#calculate_hand" do
    hand1 = Hand.new()
    hand2 = Hand.new()
    hand3 = Hand.new()
    hand4 = Hand.new()
    king = Card.new('K','♦')
    queen = Card.new('Q','♦')
    three = Card.new('3','♠')
    nine = Card.new('9','♦')
    seven = Card.new('7','♦')
    firstAce = Card.new('A','♣')
    five = Card.new('5','♠')
    secondAce = Card.new('A','♥')
    thirdAce = Card.new('A','♠')

    it "should return a value of 17" do
      hand_1 = []
      hand_1 << nine
      hand_1 << firstAce
      hand_1 << five
      hand_1 << secondAce
      hand_1 << thirdAce
      hand1.get_card(hand_1)
      hand1.sort_hand
      hand1.calculate_hand

      expect(hand1.calculate_hand).to eq(17)
    end
    it "should return 20" do
      hand_2 = []
      hand_2 << nine
      hand_2 << firstAce
      hand2.get_card(hand_2)

      expect(hand2.calculate_hand).to eq(20)
    end
    it "should return 21" do
      hand_3 = []
      hand_3 << king
      hand_3 << queen
      hand_3 << firstAce
      hand3.get_card(hand_3)

      expect(hand3.calculate_hand).to eq(21)
    end
    it "should return 21" do
      hand_4 = []
      hand_4 << nine
      hand_4 << firstAce
      hand_4 << king
      hand4.get_card(hand_4)

      expect(hand4.calculate_hand).to eq(21)
    end
    it "should return 21" do
      hand_5 = []
      hand_5 << nine
      hand_5 << three
      hand_5 << firstAce
      hand_5 << seven
      hand5.get_card(hand_5)

      expect(hand5.calculate_hand).to eq(21)
    end
  end
end

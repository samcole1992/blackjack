class Hand
  # Your code here
  attr_accessor :cards, :sum
  def initialize
    @sum = 0
    @cards = []
  end

  def get_card(new_cards)
    new_cards.each do |card|
      @cards << card
    end
  end

  def calculate_hand
    ace_counter = 0
    @sum = 0
    @cards.each do |card|
      if card.rank == "A"
        ace_counter += 1
        # @sum += card
      else
        @sum += card.value
      end
    end

    if ace_counter > 0
      while ace_counter != 0 do
        card = ace_calculation
        @sum += card
        ace_counter -= 1
      end
    end
    return @sum
  end

  def ace_calculation
    if @sum < 11
      ace = 11
    else
      ace = 1
    end
    return ace
  end
end


#
# class Hand
#   # Your code here
#   attr_accessor :cards, :sum
#   def initialize
#     @sum = 0
#     @cards = []
#     @sort_hand = sort_hand
#   end
#
#   def get_card(new_cards)
#     new_cards.each do |card|
#       @cards << card
#     end
#   end
#
#   def sort_hand
#     @cards.each do |card|
#       if card.rank=="A"
#         @cards.delete(card)
#         @cards.push(card)
#       end
#     end
#   end
#
#   def calculate_hand
#     @sum = 0
#     @sort_hand.each do |card|
#       if card.rank == "A" && @sum<11
#         @sum+= 11
#       elsif card.rank =="A" && @sum>=11
#         @sum+=1
#       else
#         @sum+=card.value
#       end
#     end
#     return @sum
#   end
# end

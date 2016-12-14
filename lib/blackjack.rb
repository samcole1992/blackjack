require_relative "card"
require_relative "deck"
require_relative "hand"


deck = Deck.new
player = Hand.new
dealer = Hand.new

dealer_limit = 17
# Your code here...
puts "Welcome to BlackJack"
puts ""
player.get_card(deck.deal(2))
puts "Player was dealt: #{player.cards[0].rank + player.cards[0].suit}"
puts "Player was dealt: #{player.cards[1].rank + player.cards[1].suit}"
puts "Player total: #{player.calculate_hand}"
puts ""
dealer.get_card(deck.deal(2))
puts "Dealer was dealt: #{dealer.cards[0].rank + player.cards[0].suit}"

while true do
  if player.calculate_hand == 21
    break
  end
  puts ""
  print "Hit or stand (H/S): "
  user_input = gets.chomp.downcase
  if user_input == "h"
    player.get_card(deck.deal(1))
    puts "Player was dealt:  #{player.cards[-1].rank}#{player.cards[-1].suit}"
    puts "Player total: #{player.calculate_hand}"

    if player.calculate_hand > 21
      break
    end
  else
    puts "Player total: #{player.calculate_hand}"
    break
  end
end
puts ""
puts "Dealer revealed second card: #{dealer.cards[1].rank + player.cards[1].suit}"
puts ""

if dealer.calculate_hand > 21
  puts "Dealer busts."
elsif dealer.calculate_hand >= dealer_limit && dealer.calculate_hand <= 21
  puts "Dealer total: #{dealer.calculate_hand}"
  puts "Dealer stands."
end

while dealer.calculate_hand < dealer_limit && player.calculate_hand < 21 do
  puts "Dealer hits."
  dealer.get_card(deck.deal(1))
  puts "Dealer was dealt: #{dealer.cards[-1].rank + player.cards[-1].suit}"
  puts "Dealer total: #{dealer.calculate_hand}"
end

puts ""
if player.calculate_hand > 21
  puts "Bust! You lose..."
elsif dealer.calculate_hand > 21
  puts "You Win!"
elsif player.calculate_hand < dealer.calculate_hand
  puts "You lose"
else
  puts "You Win!"
end

module Hand
  MAX_TOTAL = 21
  DEALER_MAX = 17
  attr_reader :cards_in_hand

  def initialize
    @cards_in_hand = []
  end

  def busted?
    total > MAX_TOTAL
  end

  def total
    sum = 0

    cards_in_hand.each do |card|
      sum += if card.ace?
               11
             elsif card.jack? || card.queen? || card.king?
               10
             else
               card.value.to_i
             end
    end
    correct_for_aces(sum)
  end

  def correct_for_aces(sum)
    cards_in_hand.select(&:ace?).count.times do
      sum -= 10 if sum > MAX_TOTAL
    end
    sum
  end
end

class Player
  include Hand
end

class Dealer
  include Hand
end

class Deck
  def initialize
    @deck = create_a_new_deck.shuffle
  end

  def create_a_new_deck
    cards = []

    Card::SUITS.each do |suit|
      Card::VALUES.each do |value|
        cards << Card.new(suit, value)
      end
    end
    cards
  end

  def deal
    @deck.pop
  end
end

class Card
  SUITS = %w(Hearts Diamonds Clubs Spades)
  VALUES = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)

  attr_reader :value

  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def to_s
    "#{value} of #{@suit}"
  end

  def ace?
    value == 'Ace'
  end

  def king?
    value == 'King'
  end

  def queen?
    value == 'Queen'
  end

  def jack?
    value == 'Jack'
  end
end

class Game
  attr_reader :deck

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    display_welcome
    deal_cards
    display_hands_with_unknown
    player_turn
    dealer_turn if !@player.busted?
    show_result
  end

  private

  def clear
    system 'clear'
  end

  def display_welcome
    clear
    puts("Welcome to twenty-one game!")
    puts("Press enter to play")
    gets.chomp
  end

  def deal_cards
    2.times do
      @player.cards_in_hand << deck.deal
      @dealer.cards_in_hand << deck.deal
    end
  end

  def display_hands_with_unknown
    clear
    puts("Dealer has: #{@dealer.cards_in_hand[0]} and unknown card")
    puts("You have: #{joinor(@player.cards_in_hand)}, so a total of #{@player.total}")
  end

  def joinor(arr, separator = ', ', final = 'and')
    return arr[0].to_s if arr.size == 1
    return arr.join(" #{final} ") if arr.size == 2
    final_string = ''
    arr.each_with_index do |item, index|
      if index < (arr.size - 1)
        final_string << item.to_s
        final_string << separator
      else
        final_string << final + " "
        final_string << item.to_s
      end
    end
    final_string
  end

  def player_turn
    loop do
      puts "hit or stay?"
      answer = gets.chomp.downcase
      if answer != 'hit' && answer != 'stay'
        puts "Only hit or stay are valid"
        next
      end
      @player.cards_in_hand << deck.deal if answer == 'hit'
      break if answer == 'stay' || @player.busted?
      display_hands_with_unknown
    end
    player_result
  end

  def player_result
    clear
    if @player.busted?
      puts "Sorry, you busted!"
    else
      puts "You chose to stay!"
    end
  end

  def dealer_turn
    puts "Now is the dealer's turn"
    puts "---------------------------------"
    while @dealer.total < Dealer::DEALER_MAX
      @dealer.cards_in_hand << deck.deal
    end
    puts "Dealer busted!" if @dealer.busted?
    puts "The dealer has completed its turn"
  end

  def show_result
    display_full_hands
    if @player.total > Hand::MAX_TOTAL
      puts "You busted, so the dealer wins!"
    elsif @dealer.total > Hand::MAX_TOTAL
      puts "The dealer busted, so you win!"
    else
      champion = winner
      if champion == "tie"
        puts "There has been a tie!"
      else
        puts "The winner is the #{champion} "
      end
    end
  end

  def display_full_hands
    puts("Dealer has: #{joinor(@dealer.cards_in_hand)}, so a total of #{@dealer.total}")
    puts("You have: #{joinor(@player.cards_in_hand)}, so a total of #{@player.total}")
  end

  def winner
    if @dealer.total == @player.total
      "tie"
    elsif @player.total > @dealer.total
      "player"
    else
      "dealer"
    end
  end
end

Game.new.start

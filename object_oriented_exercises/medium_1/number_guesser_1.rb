class GuessingGame
  attr_accessor :number_to_guess, :number_guessed, :remaining_guesses

  def initialize
    @number_to_guess = nil
    @number_guessed = nil
    @remaining_guesses = nil
  end

  def play
    create_new_game
    loop do
      display_guess_info
      ask_for_num
      input_info
      break if won? || run_out?
    end
    result
  end
  private

  def create_new_game
    self.number_to_guess = (1..100).to_a.sample
    self.remaining_guesses = 7
    self.number_guessed = 0
  end

  def display_guess_info
    puts "You have #{remaining_guesses} guesses remaining"
  end

  def ask_for_num
    loop do
      print "Enter a number between 1 and 100: "
      self.number_guessed = gets.chomp.to_i
      if (1..100) === number_guessed
        self.remaining_guesses -= 1
        break
      else
        print "Invalid guess. "
      end
    end
  end

  def input_info
    case
    when won?
      puts "That's the number!"
    when number_guessed < number_to_guess
      puts "Your guess is too low"
    else
      puts "Your guess is too high"
    end
    puts ''
  end

  def won?
    number_guessed == number_to_guess
  end

  def run_out?
    remaining_guesses <= 0
  end

  def result
    won? ? puts("You won!") : puts("You have no more guesses. You lost!")
    puts ""
    puts "-----------"
  end
end

game = GuessingGame.new
game.play

game.play
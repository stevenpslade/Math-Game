require_relative 'player'
require 'pry'
# Interface between standard I/O and player info/behavior
class PlayGame
  attr_accessor :player1, :player2
  # Instantiates 2 players to play the game
  def initialize
    @player1 = get_player_name('1')
    @player2 = get_player_name('2')
    @current_player = @player1
  end

  # Gets the name of the player
  def get_player_name(n)
    puts "Player #{n}, what's your name?"
    name = gets.chomp
    Player.new(name)
  end

  # Generates a random number from 0 to 20
  def random_number
    num = rand(0..20)
    num.floor
  end

  # Generates a random math operator
  def random_operator
    @operator = [:+, :-, :*].sample
  end

  # Generates a math question (with total) for the players to answer
  def generate_question
    @a = random_number
    @b = random_number
    # This switches number @a and number @b unless the former is larger.
    # This ensures no negatives when minus is called, and if division is incorporate,
    # total will be greater than zero.
    @a, @b = @b, @a unless @a > @b
    @total = @a.send(random_operator, @b)
  end

  # Asks a math question
  def ask_question
    puts "#{@current_player.name} what is the answer to: #{@a} #{@operator} #{@b} = ?"
  end

  # Gets player's answer
  def get_player_answer(player)
    player.answer
  end

  #Checks the answer of the player compared to the total of the math question
  def verify_answer(answer)
    if answer == @total.to_s
      puts "Right!"
    else
      puts "Wrong! The correct answer is #{@total}"
      @current_player.lose_life
    end
  end

  # Let's the player's know their life count
  def life_count
    puts "#{@player1.name}'s lives: #{@player1.lives}\n#{@player2.name}'s lives: #{@player2.lives}"
  end

  # Switches which player is currently playing
  def rotate_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  # Declares a winner based off lives count
  def declare_winner
    if (@player1.lives == 0 && @player2.lives == 0)
      puts "It's a tie!"
    elsif @player1.lives == 0
      puts "#{@player2.name} is the winner with a life count of #{@player2.lives}!"
    else
      puts "#{@player1.name} is the winner with a life count of #{@player1.lives}!"
    end
  end

  # Restarts or quits game
  def play_again
    puts "Do you want to play again? (yes/no)"
    answer = gets.chomp
    if answer == "yes"
      @player1.lives = 3
      @player2.lives = 3
      start
    elsif answer == "no"
      puts "Goodbye!"
    else
      puts "Please write yes or no"
    end   
  end

  #Starts game between player1 and player2
  def start
    while (@current_player.lives != 0)
      generate_question
      ask_question
      verify_answer(get_player_answer(@current_player))
      life_count
      rotate_players
    end
    declare_winner
    play_again
  end
end
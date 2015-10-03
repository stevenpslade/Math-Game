#  Information about the player playing the game
class Player

  attr_accessor :name, :lives
  # Instantiates the player's information
  def initialize(name)
    @name = name
    @lives = 3
  end

  # Removes 1 life from a player
  def lose_life
    @lives -= 1
    puts "#{@name} loses a life and has #{@lives} remaining!"
  end

  #The answer the player gives
  def answer
    gets.chomp
  end

end


#  Information about the player playing the game
class Player

  attr_accessor :name, :lives, :point
  # Instantiates the player's information
  def initialize(name)
    @name = name
    @lives = 3
    @point = 0
  end

  # Removes 1 life from a player
  def lose_life
    @lives -= 1
    puts "#{@name} loses a life and has #{@lives} remaining!"
  end

  def get_point
    @point += 1
    puts "#{@name} gains a point and has #{@point} in total!"
  end

  #The answer the player gives
  def answer
    gets.chomp
  end

end


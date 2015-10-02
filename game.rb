require "pry"

@player1 = 3
@player2 = 3

def random_num
  num = rand(0..20)
  num.floor
end

def generate_question
  @a = random_num
  @b = random_num
  @total = @a + @b
end

def prompt_player
  generate_question
  p "#{@a} + #{@b} = ?"
  @answer = gets.chomp.to_i
end

def verify_answer
  @answer == @total
end

run = "1"

while (run != "0")
  while (@player1 != 0)
    puts "Player1! What's the right answer?"
    prompt_player
    verify_answer
    if (verify_answer == false)
      @player1 -= 1
      puts "Wrong"
    else
      puts "Right"
    end
    puts "Player 1 has #{@player1} lives remaining.\nPlayer 2 has #{@player2} lives remaining."
    break
  end
  while (@player2 != 0)
    puts "Player 2! What's the answer?"
    prompt_player
    verify_answer
    if (verify_answer == false)
      @player2 -= 1
      puts "Wrong"
    else
      puts "Right"
    end
    puts "Player 2 has #{@player2} lives remaining.\nPlayer 1 has #{@player1} lives remaining."
    break
  end
  if (@player1 == 0 && @player2 == 0)
    puts "It's a tie!"
    run = "0"
  elsif (@player1 == 0)
    puts "Player 2 is the winner, with #{@player2} lives remaining!"
    run = "0"
   elsif (@player2 == 0)
    puts "Player 1 is the winner, with #{@player1} lives remaining!"
    run = "0"
  end
end










require 'colorize'

@name = [] 
@qq = 0
@answer = 0
@life = 3

def display_question(player_array)
  q = [rand(20).to_i,rand(20).to_i,rand(4).to_i]
  case q[2]
  when 0
    q[3] = q[0] + q[1]
    q[2] = "+"
  when 1
	q[3] = q[0] - q[1]
	q[2] = "-"
  when 2
	q[3] = q[0] * q[1]
	q[2] = "*"
  when 3
    q[3] = q[0] / q[1]
	q[2] = "/"
  end

  puts "\n-----------------------------------------".magenta
  puts "What is #{q[0]} #{q[2]}  #{q[1]} = ?".light_blue
  @qq = q[3]
  return @qq
  return
end

def verify_answer(correct_answer,user_answer)
  correct_answer == user_answer
end

def play(player_array)
  player_array.each do |player|  
    puts player.to_s.red + " , it's your turn."
    display_question(player_array)
    @answer = gets.chomp.to_i

    unless verify_answer(@qq, @answer)
      @life -= 1
	  puts player[player].to_s.red + ", that's not the right answer."
	  puts "Now you have #{@life} lives left."
    end
  end
  return true
end

def game_over(name)
	puts "#{@name.red}, you've run out of lives! \n\n"
	puts "GAME OVER".red
end

def display_life(player_array)
  	player_array.each do |player| 
	  if @life == 0
	  game_over(@name)
	  puts "Do you want to restart the game? (yes/no)".blue
	  ans = gets.chomp.downcase
	  return exit  unless ans == "yes"
	  plr_arr.each {|a| a.life = 3}
	  return true
	  end
	end
	return false
end

def main
  player_array = []
  2.times do
    print "Please enter your name: "
	@name = gets.chomp
	player_array << @name
  end

  player_array.each {|player| print player[player].to_s.red + " has 3 lives left.".blue}
  print "\n\n"

  while true
	player_array.each do |player|  
	  play(player_array) == false unless display_life(player_array)
	end
  end
end

main()


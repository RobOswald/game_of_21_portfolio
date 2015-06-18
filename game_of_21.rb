class TwentyOne

# Let's get it started.
def initialize(answer)    
    @deck = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    @p_hand = 0
    @c_hand = 0
    @p_draw = 0
    @c_draw = 0
    startgame
end

# Initiates game
def startgame
    puts ""
    puts ""
    puts "Let's begin."
   	comp_draw
end

# Computer draws a number and then hands off to player
def comp_draw
	@c_draw = @deck.sample
    @deck.delete(@c_draw)
	@c_hand = @c_hand + @c_draw
    player_draw
end

# Player draws and then we're off to display
def player_draw
	@p_draw = @deck.sample
	@deck.delete(@p_draw)
	@p_hand = @p_hand + @p_draw
	display
end

# This is for the final draw from the computer if the player abstains from drawing another.
def comp_one_more_draw
    @c_draw = @deck.sample
    @deck.delete(@c_draw)
	@c_hand = @c_hand + @c_draw
	puts "The computer drew #{@c_draw}."
	puts ""
	puts "Final score. Your hand = #{@p_hand}. Computer hand = #{@c_hand}."
	if @c_hand > 21
	    puts "The computer busted. You win!"
	elsif @c_hand == @p_hand
	    puts "It's a tie. Wow! Try again."
	elsif @c_hand > @p_hand
	    puts "The computer hand is bigger. You lose. Try again."
	else
	    puts "Your hand is bigger. You win!"
	end
end
	
# Displays what was drawn from player_draw and comp_draw	
def display
    puts "-" * 40
    puts ""
	puts "You drew #{@p_draw}."
	puts "The computer drew #{@c_draw}."
	results
end

# Displays results. Multiple pathways for the responses
def results	
	if @p_hand > 21 && @c_hand <= 21
		puts ""
		puts "You went over 21. Sorry. Game over."
		puts "Final score. Your hand = #{@p_hand}. Computer hand = #{@c_hand}."
	elsif @p_hand > 21 && @c_hand > 21
		puts ""
		puts "You and the computer both went over 21. You both busted."
		puts "Final score. Your hand = #{@p_hand}. Computer hand = #{@c_hand}."
	elsif @p_hand <= 21 && @c_hand > 21
		puts ""
		puts "The computer busted with #{@c_hand}. You win!"
		puts "Final score. Your hand = #{@p_hand}. Computer hand = #{@c_hand}."
	elsif @p_hand == 21 && @c_hand < 21
		puts ""
	    puts "You hit 21 first. You win!"
	    puts "Final score. Your hand = #{@p_hand}. Computer hand = #{@c_hand}."
	elsif @p_hand < 21 && @c_hand == 21
		puts ""
	    puts "The computer hit 21. They win!"
	    puts "Final score. Your hand = #{@p_hand}. Computer hand = #{@c_hand}."
	else
		puts ""
		puts "Your hand = #{@p_hand}. The computer hand = #{@c_hand}."
		puts ""
		print "Draw again? (y/n) "
		answer = gets.chomp
		answer.downcase
		case answer
		when "y", "yes"
			comp_draw
		when "n", "no"
			puts ""
			puts "Let's see what the computer draw."
			comp_one_more_draw
		else
			puts ""
			puts "That's not one of the choices. Sorry."
			results
		end
	end
	end
end

# Quick instructions
puts "Play a game of 21? You draw cards from 1-10 against the computer."
puts "First to 21 wins. If you go over 21 you automatically lose."
puts "You can make the computer draw once more than you, but if they are"
puts "higher than you without going over 21 you lose."
puts ""
print "Sound good? (y/n) "
answer = gets.chomp
answer.downcase!
case answer
when "y", "yes"
    answer = TwentyOne.new(answer)
when "n", "no"
    puts "That's sad. Bye for now."
else
    puts "I don't understand that choice. Please try again."
end

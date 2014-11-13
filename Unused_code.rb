


------
#
# def play?
#   @command_entered == 'play' || @command_entered == 'p'
# end
#
# def instructions?
#   @command_entered == 'instructions' || @command_entered == 'i'
# end
#
# require_relative "command_parser"
#
# # gets input and sends to command parser
# # receives commands from the command parser
# #
#
# class REPL
#   def initialize(mastermind)
#     @parser = CommandParser.new
#     @mastermind = mastermind
#   end

------



#-------------------

# choose_difficulty: |Choose your difficulty setting
# Beginner      = 4 positions, 4 colors
# Intermediate  = 6 positions, 5 colors
# Advanced      = 8 positions, 6 colors
# Godlike       = 10 positions, 7 colors

-------

def win?
  if @guess_entered == @chosen_colors

    puts messages['you_win']
    puts "Congratulations! You have guessed the sequence #{@chosen_colors} in #{number_of_guesses} guesses over #{Time.now - @time}"
    puts "Do you want to (p)lay again or (q)uit?"
  @end_game_command = gets.downcase.strip
end
  if @end_game_command == "play" || @end_game_command == "p"
    mastermind.play
  else
    puts messages['quitting']
    exit
  end

end
#define a win as the guess == to the random array, print stats and ask whether they want to play again, else quit

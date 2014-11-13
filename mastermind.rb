require 'yaml'            # => true, false
require_relative 'board'  # => true, false
require_relative 'repl'   # ~> NoMethodError: undefined method `strip' for nil:NilClass

class Mastermind
  attr_reader :number_of_guesses, :board, :messages, :instream, :time

  def initialize(instream = @stdinput)
    @time = Time.new
    @number_of_guesses = 0
    @chosen_colors = Board.new.generate_colors
    @messages = YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), "messages.yaml"))) #load messages
    @positions_correct = 0
    @colors_correct = 0
  end

  def play
    puts messages['game_start']
    # p @chosen_colors #for debugging
    puts messages['play']
        until get_answer.include? 'q'
            if @user_entry.count < 4
              puts "message is too short"
              next
            elsif @user_entry.count > 4
              puts "message is too long"
              next
            # elsif (@user_entry =~ /[rgybq]|(quit)/)==nil
            #   puts "invalid character"
            #   next
            end
            if correct_positions == 4
              puts messages['you_win']
              puts "Congratulations! You have guessed the sequence #{@chosen_colors} in #{number_of_guesses} guesses over #{Time.now - @time} seconds"
              break
            else
              correct_color
              @number_of_guesses +=1
              puts "Your number of guesses #{number_of_guesses}"
              puts "You have #{@colors_correct} colors correct with #{@positions_correct} in the correct positions "
            end
          end
          puts messages['play_again?']
  end

  def get_answer
    print "Please Enter Your Guess>>> "
    @user_entry = gets.strip.downcase.split(//)
  end

  # takes user entry, strips, downcases and splits it. Uses Regular Expressions to put any of what is inputted into an array

  def correct_positions
    @positions_correct = 0
    zipped_array = @user_entry.zip(@chosen_colors)
    zipped_array.each{|item| @positions_correct +=1 if item[0] == item[1]; }
    @positions_correct
  end

  #checks to see if the correct positions and colosr are shared between arrays by zipping the arrays together
  #and comparing the elements in the new array of arrays to each other. A counter is increased if true

def correct_color
  @colors_correct = @chosen_colors.map do |element|
    if @user_entry.include?(element)
      @user_entry.delete_at(@user_entry.index(element))
    end
  end.compact.count
end

 #
 # def correct_color(incorrect logically)
 #   x = @chosen_colors.{|i| i if @user_entry.include? i }
 #   @colors_correct = x.compact.count
 # end

  #checks to see if the correct color is included in the user_entry by mapping into a new array
  #all the same values shared between chosen colors and entry


end

#-----

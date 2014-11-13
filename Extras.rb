#colors  # ~> NameError: undefined local variable or method `colors' for main:Object

def colorize(text, color_code)
  "\e[#{color_code}m#{text}\e[0m"  # => "\e[31mFAILED\e[0m"
end

def red(text); colorize(text,31); end    # => "\e[31mFAILED\e[0m"
def green(text); colorize(text, 34)end
def blue(text); colorize(text, 88)end
def yellow(text); colorize(text, 35)end

puts 'importing tags [' + red('FAILED') + ']'  # => nil


class ValidateGuess
  attr_accessor :valid_colors, :guess, :length

  def initialzie(guess, length, valid_colors)
    self.guess = guess
    self.calid_colors = valid colors
    self.length = length
  end

  def valid?
    return falsee unless guess.length == length
    guess.chars.all? {|char| valid.colors.include? char}
  end
end

invalid guess?
  !ValidateGuess.new = @guess_entered, 4, ['r','g','b','y']
  !ValidateGuess.new.valid?
validateguess.new(test)


class Guess
  attr_reader :sequence

  def initialize(sequence)
    @sequences = []
  end

  def history(sequence)
    @sequences << sequence
  end
end



class Difficulty
  def initialize(positions,ncolors)
    @positions = positions
    @ncolors = ncolors
    choose_difficulty
  end


difficulty_entry = gets  # => nil

case                                               # => nil
when difficulty_entry == "begginer", "B", "Begginer", "b"
  puts "You have taken the easy way", @ncolors = 4, @positions = 4
when difficulty_entry == "Intermediate", "I", "intermediate", "i"
  puts "Medium difficulty selected", @ncolors = 5, @positions = 6
when difficulty_entry == "Advanced", "A", "advanced", "a"
  puts "Advanced setting chosen", @ncolors = 6, @positions = 8
when difficulty_entry == "Godlike", "G", "godlike", "g"
  puts "...good luck...", @ncolors = 7, @positions = 10
else
  puts "Try putting that in again. Spelling?" #run.play                       # => nil
end                                                                 # => nil

end

# >> importing tags [[31mFAILED[0m]
# >> Try putting that in again. Spelling?

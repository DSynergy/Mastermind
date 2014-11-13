require 'yaml'
require_relative 'mastermind'

class REPL
  attr_reader :command, :messages, :instream

  def initialize(instream = $stdin)
    @command_entered = ''
    @messages = YAML.load_file(File.expand_path(File.join(File.dirname(__FILE__), "messages.yaml")))
  end

# set default instream to keyboard. Default command blank. Messages loaded in a yaml file as hashes


  def process_commands_entered(command_entered)
    command = command_entered
    case command
    when "p", 'play'
        mastermind = Mastermind.new
        mastermind.play
      when 'q', 'quit'
        puts messages['quitting']
      when 'i', 'instructions'
        puts messages['instructions']
      else
        puts messages['bad_input']
      end
  end

# Case statement directing program depending on user input (command_entered)

  def run
    puts messages['intro']
    puts messages['intro_prompt']           # => nil
    until quit?
      print 'Please Enter Your Command>>> '                   # => nil
      @command_entered = gets.strip.downcase
      process_commands_entered(@command_entered)
    end
  end

# run the REPL. Intro message, get input and strip the string, downcase  and put into instance variable @command_entered.
# Then passed as an argument into process commands entered method. Q or quit will end loop in run method

  def quit?
    @command_entered == 'quit' || @command_entered == 'q'
  end

end

REPL.new.run

# ------------------------------------

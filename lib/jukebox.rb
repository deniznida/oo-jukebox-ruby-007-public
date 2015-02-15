require "pry"
class Jukebox

  def initialize(songs)
    @songs = songs
  end

  def call
    puts "Welcome to the Jukebox! Enter a command."
    input = gets.chomp

    while input != "exit" 
      if input == "help"
        help
      elsif input == "list"
        list
      elsif input == "play"
        play
      elsif input.start_with?("play")
        song = input[5..-1]
        play song
      else
        puts "Sorry, I don't know this command. Try again!"
      end

      input = gets.chomp
      
    end
  end

  def help
    puts "help - get a list of commands"
    puts "list - get a list of all the songs"
    puts "play - play a song"
    puts "exit - exit the jukebox"
  end

  def list
    @songs.each_with_index do |song, i|
      puts "#{i+1}. #{song}"
    end
  end

  def play(input = "")

    if input == "" 
      puts "What song would you like to play?\n"
      input = gets.strip
    end
    
    if input.to_i > 0 && input.to_i <= @songs.length
      index = input.to_i - 1 
      puts "Now Playing: #{@songs[index]}"
    elsif @songs.include?(input)
      puts "Now Playing: #{input}"
    end
  end
end
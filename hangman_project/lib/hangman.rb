class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word #this is a class method
    DICTIONARY.sample
  end

  def initialize
    random = Hangman.random_word
    @secret_word = random
    @guess_word = Array.new(random.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    if @attempted_chars.include?(char)
      return true
    end
    return false
  end

  def get_matching_indices(char)
    arr = []
    @secret_word.each_char.with_index do |el,i|
      if el == char
        arr << i
      end
    end
    arr
  end

  def fill_indices(char, arr)
    arr.each do |num|
      @guess_word[num] = char
    end
  end

  def try_guess(char)
    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    end

    @attempted_chars  <<char

    matches =  self.get_matching_indices(char)
    position = self.fill_indices(char,matches)
    true

    if matches.length < 1
      @remaining_incorrect_guesses -= 1
    end
    true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    var = gets.chomp

    self.try_guess(var)
  end

  def win?
    if @guess_word.join("") == @secret_word
      puts "WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? == true || self.lose? == true
      puts @secret_word
      return true
    else
      return false
    end
  end



end

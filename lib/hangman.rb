class Hangman
  attr_accessor :mistaken_letters, :right_guesses, :visualised_word
  attr_reader :secret_word
  def initialize()
    @mistaken_letters = []
    @right_guesses = " "
    @secret_word = create_secret_code
    @visualised_word = visualise_the_word
  end

  def create_secret_code
    dictionary = File.readlines("lib/5desk.txt")
    sample_word = dictionary.sample.strip
    until sample_word.length.between?(5, 12)
      sample_word = dictionary.sample.strip
    end
    sample_word.downcase
  end

  def valid?(guess)
    guess = guess.chomp.downcase

    return false if guess.size != 1
    return false unless guess.ord.between?(97,122)
    return false if (@mistaken_letters.include? guess)
    true
  end

  def analyse(guess)
    if @secret_word.include? guess
      @right_guesses += guess
    else
      @mistaken_letters << guess
    end
  end

  def feedback_of_how_many_guesses_remain
    case @mistaken_letters.size
      when 6
        message = "You don't have any guesses remain"
      when 5
        message = "You shouldn't make a wrong guess to win"
      when 4
        message = "You have #{5 - @mistaken_letters.size} guess remain for your wrong guesses."
      else
        message = "You have #{5 - @mistaken_letters.size} guesses remain for your wrong guesses."
    end
    message
  end

  def feedback_of_wrong_guesses
    if @mistaken_letters.empty?
      message = "You don't have any wrong guesses so far"
    else
      message = "Wrong guesses so far: #{@mistaken_letters.join(", ")}"
    end
    message
  end

  def visualise_the_word
    @secret_word.tr("^#{@right_guesses}", "-")
  end

  def draw_a_hangman
    return "/#{@mistaken_letters.size}..png"
  end

  def game_over?
    @visualised_word = visualise_the_word
    return true if (@mistaken_letters.size == 6)
    return true if (@visualised_word == @secret_word)
    false
  end

  def end_of_game
    @visualised_word = visualise_the_word
    return "Game over. The secret word was #{@secret_word.upcase}." if @mistaken_letters.size == 6
    return "Congratulations!" if @visualised_word == @secret_word
  end

end


















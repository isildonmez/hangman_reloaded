require_relative 'hangman'
require 'sinatra'
require 'sinatra/reloader' if development?

configure do
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET']
end



get '/' do
  unless session["hangman"]
    session["hangman"] = Hangman.new
  end
  erb :index
end

post '/guess' do
  @hangman = session["hangman"]
  if @hangman.game_over?
    session.clear
    redirect "/"
  else
    guess = params[:guess]
    message = ""
    guesses_remain = ""
    wrong_guesses = ""
    visualised_word = ""
    image_path = ""

    if @hangman.valid?(guess)
      @hangman.analyse(guess)
      message = @hangman.game_over? ? @hangman.end_of_game : ""
      guesses_remain = @hangman.feedback_of_how_many_guesses_remain
      wrong_guesses = @hangman.feedback_of_wrong_guesses
      visualised_word = @hangman.visualise_the_word
      image_path = @hangman.draw_a_hangman
      puts "image_path #{image_path}"
    else
      message = "Please enter a valid letter"
    end
    erb :guess, :locals => {:message => message,
                            :guesses_remain => guesses_remain,
                            :wrong_guesses => wrong_guesses,
                            :visualised_word => visualised_word,
                            :image_path => image_path}
  end
end

post '/reset' do
  session.clear
  redirect '/'
end
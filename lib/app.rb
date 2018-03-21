require_relative 'hangman'
require 'sinatra'
require 'sinatra/reloader' if development?


#TODO: undefined usable_guess? for nil class: initialize game instance
get '/' do
  # guess = params[:guess]
  # message = ""
  # guesses_remain = ""
  # wrong_guesses = ""
  # visualised_word = ""
  # image_path = ""
  # if guess.nil?
  #   game = Hangman.new
  # else
  #   # TODO: image_path
  #   if game.usable_guess?(guess)
  #     guesses_remain = game.feedback_of_how_many_guesses_remain
  #     wrong_guesses = game.feedback_of_wrong_guesses
  #     visualised_word = game.visualise_the_word
  #     image_path = ""
  #   else
  #     message = "Please enter a valid letter"
  #   end
  # end
  # erb :index, :locals => {:message => message,
  #                         :guesses_remain => guesses_remain,
  #                         :wrong_guesses => wrong_guesses,
  #                         :visualised_word => visualised_word,
  #                         :image_path => image_path}
end
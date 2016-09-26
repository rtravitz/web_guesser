require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

get '/' do
  guess = params["guess"].to_i
  message, color = check_guess(guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message,
                          :color => color}
end

def check_guess(guess)
  if guess.zero?
    message = ""
    color = "#fff"
  elsif(guess - SECRET_NUMBER) >= 5
    message = "Way too high!"
    color = "red"
  elsif (guess - SECRET_NUMBER) <= -5
    message = "Way too low!"
    color = "red"
  elsif guess > SECRET_NUMBER
    message = "Too high!"
    color = "pink"
  elsif guess < SECRET_NUMBER
    message = "Too low!"
    color = "pink"
  else
    message = "You got it right!\nThe secret number is #{SECRET_NUMBER}."
    color = "green"
  end
  return message, color
end

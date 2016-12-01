require 'sinatra'
require 'sinatra/reloader'

@@number = rand(101)
@@initial_message = ""

def check_guess(guess)
	if guess.to_i > @@number + 5
		message = "way too high"
	elsif guess.to_i < @@number - 5
		message = "way too low"
	elsif guess.to_i > @@number
		message = "too high"
	elsif guess.to_i < @@number
		message = "too low"
	else
		message = "correct!"
		@@initial_message = "the SECRET NUMBER is #{@@number}"
	end
	message
end

get '/' do
	guess = params["guess"]
	message = check_guess(guess)
	erb :index, :locals => {:number => @@number, :message => message, :initial_message => @@initial_message}
end
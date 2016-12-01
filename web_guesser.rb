require 'sinatra'
require 'sinatra/reloader'

@@number = rand(101)
@@initial_message = ""
@@color = ""

def check_guess(guess)
	if guess.to_i == 0
		@@color = "white"
	elsif guess.to_i > @@number + 5
		message = "way too high"
		@@color = "red"
	elsif guess.to_i < @@number - 5
		message = "way too low"
		@@color = "red"
	elsif guess.to_i > @@number
		message = "too high"
		@@color = "orange"
	elsif guess.to_i < @@number
		message = "too low"
		@@color = "orange"
	else
		message = "correct!"
		@@initial_message = "the SECRET NUMBER is #{@@number}"
		@@color = "green"
	end
	message
end

get '/' do
	guess = params["guess"]
	message = check_guess(guess)
	erb :index, :locals => {:number => @@number, :message => message, :initial_message => @@initial_message, :color => @@color}
end
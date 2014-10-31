require "sinatra"
require "mandrill"

post "/sent" do
	m = Mandrill::API.new
	message = {
		:subject=> "Hello from the Mandrill API",
		:from_name=> "#{params[:first_name]} #{params[:last_name]} #{params[:email]}",
		:text=>"#{params[:codingclass]}",
		:to=>[
			{
				:email=> "swagner2001@mac.com",
				:name=> "HerrWagner"
				}
		],
		:html=>"<html><h1>Hi <strong>message</strong>, how are you?</h1></html>",
		:from_email=>"swagner2001@mac.com"
	}

	sending = m.messages.send message
	puts sending

	erb :sent
end

get '/' do 
	erb :index
end

get '/contact' do
	erb :contact
end

get '/about_us' do
	erb :about_us
end


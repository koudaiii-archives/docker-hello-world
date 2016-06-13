# app.rb
require "sinatra"

set :environment, :production

get "/" do
  "Hello World"
  # "Hello Docker"
  # ENV["MESSAGE"]
end


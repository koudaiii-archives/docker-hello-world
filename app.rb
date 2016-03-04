# app.rb
require "sinatra"

set :environment, :production

get "/" do
  ENV["MESSAGE"]
end


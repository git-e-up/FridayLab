require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter  => "postgresql",
  :database => "userchip"
)

require './models/chirps.rb'
require './models/users.rb'


get '/' do
  erb :index
end

get '/api/users' do
  content_type :json
  users = User.all
  users.to_json
end


get '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.to_json
end

post '/api/users' do
  content_type :json
  user = User.create(params[:user])
  user.to_json
end
# Create a new user

put '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
end

# Update an existing user

patch '/api/users/:id' do
  content_type :json
  user = User.find(params[:id].to_i)
  user.update(params[:user])
  user.to_json
  end
# Update an existing user

delete '/api/users/:id' do
  content_type :json
  user = User.delete(params[:id].to_i)
  user.to_json
  end
# Delete an existing user

get '/api/users/:user_id/chirps' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  user.chirps.to_json
  end
# A specific user's chirps

get '/api/users/:user_id/chirps/:id' do
  content_type :json
  user = User.find(params[:user_id].to_i)
  chirps = Chirp.find(params[:id].to_i)
  chirps.to_json
  end
# A specific user's specific chirp

post '/api/users/:user_id/chirps' do
  content_type :json
  user = User.find(params[:user_id])
  chirp = Chirp.create(params[:chirp])
  chirp.to_json
end

# Create a Chirp for a user



put '/api/users/:user_id/chirps/:id' do
  content_type :json
  chirp = Chirp.find(params[:id].to_i)
  chirp.update(params[:chirp])
  chirp.to_json
end
# # Update a user's existing chirp



patch '/api/users/:user_id/chirps/:id' do
  content_type :json
  chirp = Chirp.find(params[:id].to_i)
  chirp.update(params[:chirp])
  chirp.to_json
end
# # Update a user's existing chirp


delete '/api/users/:user_id/chirps/:id' do
  content_type :json
  chirp = Chirp.delete(params[:id].to_i)
  chirp.to_json
end
# # Delete a user's existing chirp




# userchip=# CREATE TABLE users (id SERIAL PRIMARY KEY, name VARCHAR(255));
# CREATE TABLE
# userchip=# CREATE TABLE chirps (id SERIAL PRIMARY KEY, message VARCHAR(255), user_id INTEGER REFERENCES users(id));

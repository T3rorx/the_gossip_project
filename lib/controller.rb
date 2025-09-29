require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end
  
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
    erb :gossipx
  end
  get '/gossips/:id/edit' do
    erb :edit
  end
    post '/gossips/:id/edit' do
      id = params['id'].to_i
      author = params['gossip_author']
      content = params["gossip_content"]
    Gossip.update(id, author, content)
    redirect '/'
  end
end
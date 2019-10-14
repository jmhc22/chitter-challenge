require 'sinatra'
require 'sinatra/base'
require_relative './database_connection_setup'
require './lib/peep'
require './lib/user'

class ChitterApp < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    @peeps = Peep.all
    @user = User.current_user
    erb :index
  end

  post '/peep' do
    user_id = User.current_user.id if User.current_user
    user_id ||= nil
    Peep.create(text: %Q{#{params[:new_peep]}}, user_id: user_id)
    redirect '/'
  end

  get '/sign-up' do
    erb :sign_up
  end

  post '/sign-up' do
    User.create(name: params[:name], handle: params[:handle], email: params[:email], password: params[:password])
    User.sign_in(handle: params[:handle])
    redirect '/'
  end

  run! if app_file == $0

end

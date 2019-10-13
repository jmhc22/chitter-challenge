require 'sinatra'
require 'sinatra/base'
require_relative './database_connection_setup'
require './lib/peep'

class ChitterApp < Sinatra::Base
  enable :sessions, :method_override

  get '/' do
    @peeps = Peep.all
    erb :index
  end

  post '/peep' do
    Peep.create(text: params[:new_peep])
    redirect '/'
  end



  run! if app_file == $0

end

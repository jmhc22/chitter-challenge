require 'sinatra'
require 'sinatra/base'
# require './lib/peep'
require_relative './database_connection_setup'

class ChitterApp < Sinatra::Base
  enable :sessions, :method_override


  run! if app_file == $0

end

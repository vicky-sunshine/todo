require 'sinatra'

# Snort Message Web Service
class TaskAPI < Sinatra::Base
  enable :logging

  set :views, File.expand_path('../../views', __FILE__)
  set :public_dir, File.expand_path('../../public', __FILE__)

  get '/' do
    slim :home
  end
end

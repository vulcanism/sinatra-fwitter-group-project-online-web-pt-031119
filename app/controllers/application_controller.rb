require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "security"
  end
  
  get '/' do
    erb :index
  end
  
  helpers do
    
    def logged_in?
      
    end
    
    def current_user
      @current_user ||= User.find_by()
    end
    
  end

end

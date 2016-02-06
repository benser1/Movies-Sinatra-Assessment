require 'pry'


class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do 
    erb :index
  end

  helpers do 
    def current_user(session)
     User.find(session[:id])
    end
 
    def logged_in?(session)
     !!session[:id]
    end
  end

end ## class end
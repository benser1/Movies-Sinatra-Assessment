class UsersController < ApplicationController

  get '/signup' do
    if logged_in?(session)
      redirect '/movies'  ## need to create a movies page that shows all movies for each user #####
    else 
    erb :'/users/signup'
  end
  end

  post '/signup' do 
    @user = User.create(name: params[:name], password: params[:password], email: params[:email])
    if params[:name] == "" || params[:password] == "" || params[:email] == ""
      redirect to '/signup'
    else
      session[:user_id] = @user.id
      redirect '/movies'
    end
  end

  get '/login' do 
    if logged_in?(session)
      redirect '/movies'
    else
    erb :"/users/login"
  end
  end

  post '/login' do 
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:id] = user.id
      redirect '/movies'
    else
      redirect '/login'
    end
  end

  get '/logout' do 
    session.clear
    redirect '/' 
  end


end ## class end
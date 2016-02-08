class MoviesController < ApplicationController

  get '/movies' do 
    if logged_in?(session)
      @user = current_user(session)
      erb :'/movies/movies'
    else
      redirect '/login'
    end
  end

  get '/movies/new' do 
    if logged_in?(session) 
      erb :'/movies/add_movie'
    else
      redirect '/login' 
    end
  end

  post '/movies/new' do 
      @movie = Movie.find_or_create_by(:name => params[:movie][:name], :year_released => params[:movie][:year_released])
      @user = current_user(session)
      @movie.user_id = @user.id
      @movie.save
      redirect '/movies'
  end

  get '/movies/:id' do 
    @movie = Movie.find_by_id(params[:id])
    if logged_in?(session)
      erb :'/movies/show_movie'
    else
      redirect '/login'
    end
  end

  get '/movies/:id/edit' do 
    @movie = Movie.find_by(id: params[:id])
    if logged_in?(session)
      erb :'/movies/edit_movie'
    else 
      redirect '/login'
    end
  end

  post '/movies/:id/edit' do 
    @movie = Movie.find_by(id: params[:id])
    if @movie.update(name: params[:movie][:name], year_released: params[:movie][:year_released])
      redirect '/movies'
    else
      redirect '/movies/#{@movie.id}/edit'
    end
  end

  delete '/movies/:id/delete' do
    if logged_in?(session)
       @movie = Movie.find_by_id(params[:id])
       if session[:id] == @movie.user_id
        @movie.delete 
        redirect '/movies'
     else
       redirect '/login'
     end
   end
 end

end ## class end
















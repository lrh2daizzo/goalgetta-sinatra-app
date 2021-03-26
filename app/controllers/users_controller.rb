class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'users/signup'
        else
            redirect to '/goals'
        end
    end

    post '/signup' do
        # does not let user signup if any input empty 
        if params[:username].empty? || params[:email].empty? || params[:password].empty?
            redirect to "/signup"
        else
            @user = User.create(params)
            session[:id] = @user.id
            redirect to "/users/#{@user.id}"
        end
    end

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id 
            binding.pry 
            redirect to "/users/#{@user.id}"
        else
            redirect to '/login'
        end
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'users/show'
    end

   delete '/users/:id' do
       @user = User.find(params[:id])
       @user.delete 
       redirect to "/"
   end
end

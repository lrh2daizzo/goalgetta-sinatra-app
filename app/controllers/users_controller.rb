class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.create(params)
        session[:id] = @user.id
        redirect to "/users/#{@user.id}"
    end

    get '/login' do
        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
        if @user && @user.authenticate(params[:password])
            session[:id] = @user.id 
            redirect to "/users/#{@user.id}"
        else
            redirect to '/login'
        end
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'users/show'
    end
end

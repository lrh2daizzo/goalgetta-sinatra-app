class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.create(params)
        redirect to "/users/#{@user.id}"
    end

    get '/login' do
        erb :'users/login'
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'users/show'
    end
end

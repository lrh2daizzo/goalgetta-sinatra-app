class UsersController < ApplicationController
    get '/users/:id' do
        @user = User.find(params[:id])
        erb :'users/show'
    end

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        @user = User.create(params)
        redirect to "/users/#{@user.id}"
    end
end

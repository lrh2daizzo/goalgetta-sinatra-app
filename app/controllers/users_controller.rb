class UsersController < ApplicationController
    get '/users' do
        erb :'users/show'
    end

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        params.to_s 
        redirect to '/users'
    end
end

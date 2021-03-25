class GoalsController < ApplicationController
    get '/goals' do
        @goals = current_user.goals 
        erb :'goals/index'
    end

    get '/goals/new' do
        erb :'goals/new'
    end

    post '/goals' do
        params.to_s
    end
end

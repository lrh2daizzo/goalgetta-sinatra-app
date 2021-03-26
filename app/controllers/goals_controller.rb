class GoalsController < ApplicationController
    get '/goals' do
        if logged_in?
            @goals = current_user.goals 
            erb :'goals/index'
        else 
            redirect to ''
        end
    end

    get '/goals/new' do
        if logged_in?
            erb :'goals/new'
        end
    end

    post '/goals' do
      params.to_s
    end
end

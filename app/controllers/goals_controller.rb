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
        binding.pry 
        erb :'goals/new'
    end

    post '/goals' do
      params.to_s
    end
end

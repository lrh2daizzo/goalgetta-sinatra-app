class GoalsController < ApplicationController
    get '/goals/new' do
        erb :'goals/new'
    end

    post '/goals' do
        params.to_s
    end
end

class GoalsController < ApplicationController
    get '/goals/new' do
        erb :'goals/new'
    end
end

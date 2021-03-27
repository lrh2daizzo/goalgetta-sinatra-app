class GoalsController < ApplicationController
    get '/goals' do
        if logged_in?
            @goals = current_user.goals 
            erb :'goals/index'
        else 
            redirect to '/'
        end
    end

    get '/goals/new' do
        if logged_in?
            erb :'goals/new'
        end
    end

    post '/goals' do
       if logged_in?
            unless params[:goals][:title].empty?
                @goal = current_user.goals.build(params[:goals])
                if @goal.save 
                    redirect to "/goals"
                else
                    redirect to '/goals/new'
                end
            end
        else
            redirect to "/"
        end
    end

end

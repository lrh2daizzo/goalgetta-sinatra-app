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

    get '/goals/:id' do
        @goal = Goal.find(params[:id])
        erb :'goals/show'
    end

    get '/goals/:id/edit' do
        @goal = Goal.find(params[:id])
        erb :'goals/edit'
    end

    patch '/goals/:id' do
        if logged_in?
            if params[:goals][:title].empty?
                redirect to "/goals/#{@goal.id}/edit"
            else
                    @goal = Goal.find(params[:id])
                    if @goal && @goal.user == current_user
                        if @goal.update(params[:goals])
                            redirect to "/goals/#{@goal.id}"
                        else
                            redirect to "/goals/#{@goal.id}/edit"
                        end
                    else  
                        redirect to '/goals'
                    end
            end
        else
            redirect to '/'
        end
    end

    delete '/goals/:id/delete' do
        if logged_in?
            @goal = Goal.find_by_id(params[:id])
            if @goal && @goal.user == current_user
                @goal.delete 
            end
            redirect to "/goals"
        else
            redirect to '/login'
        end
    end
end




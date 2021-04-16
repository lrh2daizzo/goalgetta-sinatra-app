class GoalsController < ApplicationController

    use Rack::Flash 

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
        else
            redirect to '/login'
        end
    end

    post '/goals' do
       if logged_in?
            if params[:goals][:title] = ""
                flash[:message] = "ERROR: Must have valid title."
                redirect to '/goals/new'
            else
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
        if logged_in?
            @goal = Goal.find(params[:id])
            erb :'goals/show'
        else
            redirect to "/login"
        end
    end

    get '/goals/:id/edit' do
        if logged_in?
            @goal = Goal.find(params[:id])
            if @goal && @goal.user == current_user
                erb :'goals/edit'
            else
                redirect to "/goals"
            end
        else
            redirect to '/login'
        end
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




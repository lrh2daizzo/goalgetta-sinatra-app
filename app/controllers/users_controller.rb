class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :'users/signup'
        else
            redirect to '/goals'
        end
    end

    post '/signup' do
        # does not let user signup if any input is empty 
        if params[:username].empty? || params[:email].empty? || params[:password].empty?
            redirect to "/signup"
        else
            @user = User.create(params)
            session[:id] = @user.id
            redirect to "/users/#{@user.id}"
        end
    end

    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect to '/goals'
        end
    end

    post '/login' do
        @user = User.find_by(:username => params[:username])
    
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 
            redirect to "/users/#{@user.id}"
        else
            redirect to '/login'
        end
    end

    get '/users/:id' do
        if logged_in?
            @user = User.find(params[:id])
            if @user == current_user
                erb :'users/show'
            else
                redirect to '/goals'
            end
        else 
            redirect to '/login'
        end
    end


    post '/logout' do
        if logged_in? 
            session.clear
            redirect to '/login'
        else 
            redirect to '/'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect to '/login'
        else
            redirect to '/'
        end
    end

   delete '/users/:id' do
       @user = User.find(params[:id])
       @user.delete 
       redirect to "/"
   end

end

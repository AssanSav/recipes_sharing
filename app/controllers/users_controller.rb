class UsersController < ApplicationController

    
    get "/signup" do
        erb :"/users/signup.html"
    end
    
    post "/signup" do
        @user = User.new(username: params[:username], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
        if @user && !params[:username].empty? && !params[:email].empty? && !params[:password].empty? && !params[:password_confirmation].empty?
            if @user.save 
                session[:user_id] = @user.id
                redirect to '/recipes/new' 
            else 
                flash.now[:message] = "Username Or Email address Already Taken!"
                erb :"/users/signup.html"
            end
        else
            flash.now[:message] = "No Column Can Be left Blank!"
            erb :"/users/signup.html"
        end
    end
    
end
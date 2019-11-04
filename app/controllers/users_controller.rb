class UsersController < ApplicationController

    get "/signup" do
      erb :"/users/signup.html"
    end
  
    post "/signup" do
      @user = User.create(username: params[:user][:username], email: params[:user][:email], password: params[:user][:password], password_confirmation: params[:password_confirmation])
      if params[:user][:username] !=nil && params[:user][:email] !=nil && params[:user][:password] !=nil && params[:password_confirmation] !=nil
        session[:user_id] = @user.id
        redirect to '/recipes/new'
      else
        flash[:message] = "Check Your Inputs! No Column Can't Be left Blank!"
      erb :"/users/signup.html"
      end
    end
  
end
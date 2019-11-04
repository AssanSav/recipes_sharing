class SessionController < ApplicationController
    get "/login" do
        erb :"/users/login.html"
      end
    
      post "/login" do
        @user = User.find_by_username(params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id 
          redirect to "/recipes/new"
        else 
          flash[:message] = "Invalid Username Or Password!"
        erb :"/users/login.html"
        end
      end
    
      delete "/logout" do
        session.clear
        redirect "/"
      end
end
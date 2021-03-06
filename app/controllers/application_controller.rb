require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions 
        set :session_secret, ENV.fetch('SESSION_SECRET')

        use Rack::Flash
        enable :sessions
    end

    get "/" do
        erb :index
    end

    helpers do 

        def current_user 
            @current_user ||= User.find_by_id(session[:user_id])
        end

        def logged_in?
            !current_user.nil?
        end

        def redirect_if_not_logged_in?
            if !logged_in? 
                redirect to '/'
            end
        end
    end

end

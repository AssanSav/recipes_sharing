class RecipesController < ApplicationController

    get "/recipes" do
        @recipes = Recipe.all
        erb :"/recipes/index.html"
    end

    get "/recipes/new" do
        redirect_if_not_logged_in?
        @recipes = Recipe.all.visible
        erb :"/recipes/new.html"
    end

    post "/recipes" do
        redirect_if_not_logged_in?
        @recipe = current_user.recipes.new(name: params[:recipe][:name], ingredient: params[:recipe][:ingredient], process: params[:recipe][:process])
        if !params[:recipe][:name].empty? && !params[:recipe][:ingredient].empty? && !params[:recipe][:process].empty?
            @recipe.save
            @recipe
            flash[:message] = "Recipe successfully Created"
            redirect ("/recipes/#{@recipe.id}")
        else
            flash[:message] = "No Column Can Be Left Blank!!!"
            redirect to "/recipes/new"
        end
    end

    get "/recipes/:id" do
        redirect_if_not_logged_in?
        @recipe = Recipe.find_by_id(params[:id])
        erb :"/recipes/show.html"
    end

    get "/recipes/:id/edit" do
        redirect_if_not_logged_in?
        @recipe = current_user.recipes.find_by_id(params[:id])
        if @recipe
            erb :"/recipes/edit.html"
        else 
            redirect to '/recipes/new'
        end
    end
    
    patch '/recipes/:id' do 
        redirect_if_not_logged_in?
        @recipe = current_user.recipes.find_by_id(params[:id])
        if @recipe
            @recipe.update(name: params[:recipe][:name], ingredient: params[:recipe][:ingredient], process: params[:recipe][:process])
            flash[:message] = "Recipe Successfully Updated!"
            redirect to "/recipes/#{@recipe.id}"
        else 
            flash.now[:message] = "Sorry Record Not Found!"
            erb :'recipes/edit.html'
        end
    end

    delete '/recipes/:id' do 
        redirect_if_not_logged_in?
        @recipe = Recipe.find_by_id(params[:id])
        redirect '/recipes/new' unless @recipe
        @recipe.update(deleted: true)
        flash[:message] = "Recipe Successfully Deleted!"
        redirect to '/recipes/new'
    end

end
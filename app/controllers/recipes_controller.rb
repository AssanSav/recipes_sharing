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
        @recipe = current_user.recipes.new(name: params[:recipe][:name], ingredient: params[:recipe][:ingredient], process: params[:recipe][:process])
        if !params[:recipe][:name].empty? && !params[:recipe][:ingredient].empty? && !params[:recipe][:process].empty?
            @recipe.save
            @recipe
            flash[:message] = "You successfully Created A New Recipe"
            redirect ("/recipes/#{@recipe.slug}")
        else
            flash[:message] = "No Column Can't Be Left Blank!!!"
            redirect to "/recipes/new"
        end
    end
    
end
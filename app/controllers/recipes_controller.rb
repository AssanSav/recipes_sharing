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

    
end
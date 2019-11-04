class CommentsController < ApplicationController

    post "/recipes/:recipe_slug/comments" do
        @recipe = Recipe.find_by_slug(params[:recipe_slug])
        if @recipe
            @comment = @recipe.comments.create(content: params[:comment][:content])
            redirect "/recipes/#{@recipe.slug}"
        else
            erb :"/comments/new.html"
        end
    end

end

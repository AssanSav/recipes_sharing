class CommentsController < ApplicationController

    post "/recipes/:recipe_slug/comments" do
        @recipe = Recipe.find_by_slug(params[:recipe_slug])
        if @recipe
            @comment = @recipe.comments.create(content: params[:comment][:content])
            flash[:message] = "Comment Can't Be Blank!"
            redirect "/recipes/#{@recipe.slug}"
        end
    end

end

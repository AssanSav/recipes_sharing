class CommentsController < ApplicationController

    post "/recipes/:recipe_id/comments" do
        @recipe = Recipe.find_by_id(params[:recipe_id])
        if @recipe
            @comment = current_user.comments.new(content: params[:comment][:content])
            @comment.recipe_id = @recipe.id
            @comment.save
            flash[:message] = "Comment Successfully Created!" 
            flash[:message] = "Comment Can't Be left Blank!" if !@comment.save
            redirect "/recipes/#{@recipe.id}"
        end
    end

    get "/recipes/:recipe_id/comments/:id/edit" do 
        @recipe = Recipe.find_by_id(params[:recipe_id])
        @comment = Comment.find_by_id(params[:id])
        if @comment 
            @comment.user_id = current_user.id
            @comment
            erb :"/comments/edit.html"
        else 
            redirect "/recipes/#{@recipe.id}"
        end
    end
    
    patch "/recipes/:recipe_id/comments/:id" do
        @recipe = Recipe.find_by_id(params[:recipe_id])
        @comment = Comment.find_by_id(params[:id])
        if @comment 
            @comment.user_id = current_user.id
            @comment.recipe_id = @recipe.id
            @comment.update(content: params[:comment][:content])
            flash[:message] = "Comment Successfully Updated!"
            redirect to "/recipes/#{@recipe.id}"
        else
            erb :"/comments/edit.html"
        end
    end

    delete "/recipes/:recipe_id/comments/:id" do 
        @recipe = Recipe.find_by_id(params[:recipe_id])
        @comment = Comment.find_by_id(params[:id])
        redirect to "/recipes/new" unless @comment
        @comment.destroy 
        flash[:message] = "Comment Successfully Deleted!"
        redirect to "/recipes/#{@recipe.id}"
    end

end

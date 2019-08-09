class CommentsController < ApplicationController
    def create
        Comment.create(post_id: params[:post_id], body: params[:co_body])
        redirect_to request.referrer
    end

    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments
        @comment.find(params[:id]).destroy
        redirect_to request.referrer
    end
end
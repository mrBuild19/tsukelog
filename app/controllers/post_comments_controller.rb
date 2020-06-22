class PostCommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = PostComment.new(post_comment_params)
		@comment.user_id = current_user.id
		@comment.post_id = @post.id
		if @comment.save
			render :index
		else
			@comments = PostComment.new
			render template: "posts/show"
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		@comment = PostComment.find_by(id: params[:id], post_id: @post.id)
		@comment.destroy
		render :index
	end

	private
	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
end

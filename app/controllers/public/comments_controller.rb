class Public::CommentsController < ApplicationController
   before_action :authenticate_end_user!,except: [:guest_sign_in]
  def create
    post = Post.find(params[:post_id])
    comment = current_end_user.comments.new(comment_params)
    comment.post_id = post.id
    comment.save
    redirect_to post_path(post.id)


  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to post_path(params[:post_id])

  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end

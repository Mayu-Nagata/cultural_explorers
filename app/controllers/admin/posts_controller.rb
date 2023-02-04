class Admin::PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end



  private

  def post_params
    params.require(:post).permit(:title, :text)

  end

  def end_user_params
    params.require(:end_user).permit( :name, :introduction, :profile_image)
  end

end

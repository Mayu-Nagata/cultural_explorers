class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!, if: :admin_url
  def top
    @posts = Post.page(params[:page])
  end
  
  private

  def post_params
    params.require(:post).permit(:title, :text)

  end

  def end_user_params
    params.require(:end_user).permit( :name, :introduction, :profile_image)
  end
  
end

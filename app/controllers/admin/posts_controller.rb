class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!, if: :admin_url
  def show
    @post = Post.find(params[:id])
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to admin_path
  end

end

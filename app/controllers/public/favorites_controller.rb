class Public::FavoritesController < ApplicationController
    before_action :authenticate_end_user!, except: [:guest_sign_in]
  def index
  end

  def create
    post = Post.find(params[:post_id])
    favorite = current_end_user.favorites.new(post_id: post.id)
    favorite.save
    #redirect_to post_path(post)
  end


  def destroy
    post = Post.find(params[:post_id])
    favorite = current_end_user.favorites.find_by(post_id: post.id)
    favorite.destroy
    #redirect_to post_path(post)
  end

end

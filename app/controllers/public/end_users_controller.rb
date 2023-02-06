class Public::EndUsersController < ApplicationController

  def index
    @end_user = current_end_user
    @post = Post.new
    @end_users = EndUser.all

  end


  def show
    @end_user = EndUser.find(params[:id])
    @posts = @end_user.posts
    @post = Post.new
  end

  def edit
    @end_user = current_end_user
  end

  def update
    @end_user = current_end_user

    if @end_user.update(end_user_params)
      flash[:notice] = "You have updated end_user successfully."
      redirect_to end_user_path(current_end_user.id)

    else

      render :edit

    end


  end

  def unsubscribe

  end

  def withdraw
    @end_user = current_end_user

    @current_end_user.update(is_deleted:true)
    reset_session
    redirect_to root_path
  end

  def new
  end

  def favorites
    @end_user = EndUser.find(params[:id])
    @posts = @end_user.favorites

    favorites = Favorite.where(end_user_id: current_end_user.id).pluck(:post_id)
    @favorite_list = Post.find(favorites)


  end

  private

  def post_params
    params.require(:post).permit( :title, :text, :comment)
  end

  def end_user_params
    params.require(:end_user).permit( :name, :introduction, :profile_image)
  end






end

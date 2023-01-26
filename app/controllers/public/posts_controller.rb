class Public::PostsController < ApplicationController
  def index
  end

  def new

    @post = Post.new

  end

  def create

    @post = Post.new(post_params)

    @post.end_user_id = current_end_user.id

      if @post.save

        flash[:notice] = 'You have posted successfully.'
        redirect_to post_path(@post.id)

      else

        @end_user = current_end_user
        @posts = Post.all


        render :index

      end






  end

  def show
  end

  private

  def post_params
    params.require(:post).permit( :image,:title, :text)

  end
end

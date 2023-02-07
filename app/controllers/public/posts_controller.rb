class Public::PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts = Post.search(params[:search])
    @end_user = current_end_user
    @end_users = EndUser.all
  end

  def new

    @post = current_end_user.posts.new

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
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    #binding.pry
    @post = Post.find(params[:id])

    if @post.end_user == current_end_user
      render "edit"

    else
      redirect_to posts_path
    end
  end

  def update
      @post = Post.find(params[:id])
      @post.end_user_id = current_end_user.id

    if @post.update(post_params)
      flash[:notice] = "You have updated post successfully."
      redirect_to post_path(@post.id)

    else
      render :edit


    end

  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/posts'
  end

  private

  def post_params
    params.require(:post).permit( :image, :title, :text)

  end
end
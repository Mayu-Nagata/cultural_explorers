class Public::TagsController < ApplicationController

  def index

    @tags = Tag.all


  end

  def show
    @tag = Tag.find(params[:id])
    @end_user = current_end_user

  end

  def destroy

    Tag.find(params[:id]).destroy()
    redirect_to tags_path

  end
end

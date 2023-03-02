class Public::TagsController < ApplicationController
   before_action :authenticate_end_user!,except: [:guest_sign_in]
  def index

    @tags = Tag.page(params[:page])


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

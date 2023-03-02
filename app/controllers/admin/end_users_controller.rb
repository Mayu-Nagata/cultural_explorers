class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!, if: :admin_url
  def index
    @end_users = EndUser.page(params[:page])
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])

    @end_user.update(end_user.params)
    redirect_to admin_end_user_path

  end


  private

  def end_user_params
    params.require(:end_user).permit(:name, :profile_image, :email, :is_deleted)

  end
end

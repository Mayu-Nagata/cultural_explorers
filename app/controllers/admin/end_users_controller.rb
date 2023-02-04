class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
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
  end


  private

  def end_user_params
    params.require(:end_user).permit(:name,:profile_image,:email)

  end
end

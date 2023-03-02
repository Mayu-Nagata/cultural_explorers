class EndUser::SessionsController < ApplicationController
  
  def guest_sign_in
    end_user = EndUser.guest
    sign_in end_user
    redirect_to end_user_path(end_user.id)
  end

end

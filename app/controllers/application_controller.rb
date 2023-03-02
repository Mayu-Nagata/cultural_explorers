class ApplicationController < ActionController::Base


  #before_action :authenticate_admin!, if: :admin_url

  def admin_url
    request.fullpath.include?("/admin")
  end

  #before_action :authenticate_end_user!, except: [:top, :about, :guest_sign_in]


end

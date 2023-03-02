class Public::HomesController < ApplicationController
   before_action :authenticate_end_user!, except: [:top, :about, :guest_sign_in]
  def top
  end

  def about
  end
  
end

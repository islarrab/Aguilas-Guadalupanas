class AdminController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = current_user
    if !(@user.coordinator? || @user.admin?)
      flash[:error] = "No se tienen los permisos necesarios para acceder"
      redirect_to :root
    end
  end

end

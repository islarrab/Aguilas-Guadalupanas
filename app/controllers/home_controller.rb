class HomeController < ApplicationController
  def index
    if user_signed_in?
      user = current_user
      if (user.admin? || user.coordinator?)
        redirect_to "/admin"
      end
    end
  end

end

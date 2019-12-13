class ApplicationController < ActionController::Base
  def authenticate_admin_user!
    authenticate_user!

    unless current_user.admin?
      redirect_to root_path
      return
    end
  end
end

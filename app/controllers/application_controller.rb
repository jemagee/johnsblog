class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

   def after_sign_in_path_for(resource)
    admin_root_path
   end

    def check_authorization
      unless (user_signed_in? && current_user.admin?)
        flash[:warning] = "You can not access that page"
        redirect_to root_path
      end
    end
end

class Admin::BaseController < ApplicationController

  before_action :check_authorization

  def index
  end

  private

    def check_authorization
      unless (user_signed_in? && current_user.admin?)
        flash[:warning] = "You can not access that page"
        redirect_to root_path
      end
    end
    
end

class Admin::BaseController < ApplicationController

  before_action :check_authorization

  def index
  end

  private

    def check_authorization
      authenticate_user!

      unless current_user.admin? 
        flash[:warning] = "You can not access that page"
        redirect_to root_path
      end
    end
    
end

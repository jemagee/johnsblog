class Admin::BaseController < ApplicationController

  before_action :check_authorization

  def index
  end
    
end

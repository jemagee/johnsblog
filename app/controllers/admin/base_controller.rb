class Admin::BaseController < ApplicationController

  before_action :check_authorization

  def index
  	@drafts = Article.drafts
  end
    
end

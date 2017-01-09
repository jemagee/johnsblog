class Admin::BaseController < ApplicationController

  before_action :check_authorization

  def index
  	@drafts = Article.drafts
  	@comments = Comment.admin_home
  end
    
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  
  def index
    @user = current_user
  end
  
end

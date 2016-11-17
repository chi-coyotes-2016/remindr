class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper

  def index
    if logged_in?
      @user = User.find_by(id: current_user.id)
    end
  end
  
end

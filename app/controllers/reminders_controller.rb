class RemindersController < ApplicationController
  include ApplicationHelper

  def index
    if logged_in?
      @user = User.find_by(id: current_user.id)
      @reminders = @user.reminders.order(time_to_go_out: :desc)
    end
  end
  
  def new

  end

  
end
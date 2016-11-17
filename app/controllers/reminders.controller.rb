class SessionsController < ApplicationController

  def new

  end

  def show
    if logged_in?
      @user - User.find_by(id: session[:user_id])
      @reminders = @user.reminders.order(time_to_go_out: :desc)
    end
  end
  
end
module ApplicationHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def pretty_time(time_stamp)
    time_stamp.strftime("%B %-m, %Y %H:%M")
  end

end

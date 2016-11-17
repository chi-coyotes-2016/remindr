class RemindersController < ApplicationController
  include ApplicationHelper

  def index
    if logged_in?
      @user = User.find_by(id: current_user.id)
      @reminders = @user.reminders.order(time_to_go_out: :desc)
    end
  end
  
  def new
  	if logged_in?
  		@user = current_user
  	else
  		redirect_to :root
  	end
  end

  def create
  	if logged_in?
  		if params[:user_id] == current_user.id

  		else

  		end

  	else

  	end

  end

  
  private
  def reminder_params
  	params.require(:article).permit(:group_id, :contact_id, :body, :time_to_go_out, :number_of_recurrences)
  end

end
class ContactsController < ApplicationController

def index
  @user = User.find_by(id: current_user.id)
  if logged_in?
    if current_user.id == session[:user_id]

    end
  end
end

end
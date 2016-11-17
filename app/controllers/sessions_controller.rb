class SessionsController < ApplicationController

  def new
    if logged_in?
      @user = User.new
    else
      @user = current_user
    end
  end

  def create
    @user = User.find_by(user_name: session_params[:user_name])
    if @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to :root
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end

  private
  def session_params
    params.require(:session).permit :user_name, :password
  end

end
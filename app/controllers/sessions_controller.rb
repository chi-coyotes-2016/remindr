class SessionsController < ApplicationController

  def new
    @user = User.new unless @user
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
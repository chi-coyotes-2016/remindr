class UsersController < ApplicationController

  def new
    @user = User.new unless @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :root
    else
      @errors = @user.errors.full_messages
      render :new
    end
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end


  private
  def user_params
    params.require(:user).permit :user_name, :first_name, :last_name, :email, :password
  end

end
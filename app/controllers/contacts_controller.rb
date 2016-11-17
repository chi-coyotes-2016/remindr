class ContactsController < ApplicationController

	def index
	  @user = User.find_by(id: current_user.id)
	  if logged_in?
	    if current_user.id == session[:user_id]

	    end
	  end
	end

	def new
		@user = User.find(params[:user_id])
		@contact = Contact.new
	end

	def create
		@user = User.find(params[:user_id])
		@contact = Contact.new(contact_params)
		@contact.user_id = @user.id
		if @contact.save
			redirect_to user_contact_path(@user, @contact)
		else
			@errors = @contact.errors.full_messages
			render 'new'
		end
	end

private
	def contact_params
		params.require(:contact).permit(:name, :phone_number)
	end

end
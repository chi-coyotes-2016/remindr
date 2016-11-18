class ContactsController < ApplicationController

	def index
	  @user = User.find_by(id: current_user.id)
	  if logged_in?
	    if params[:user_id].to_i == session[:user_id]
	    	@contacts = @user.contacts
	    else
	    	redirect_to "/"
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

	def show
		@user = User.find(params[:user_id])
		@contact = Contact.find(params[:id])
	end

	def edit
		@user = User.find(params[:user_id])
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])
		@contact.update_attributes(contact_params)
		redirect_to user_contact_url(params[:user_id], @contact)
	end

	def destroy
		@contact = Contact.find(params[:id])
		@contact.destroy
		redirect_to user_contacts_url(params[:user_id])
	end

private
	def contact_params
		params.require(:contact).permit(:name, :phone_number)
	end

end
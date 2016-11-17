require 'rails_helper'

	feature "registering a new user" do
		
		scenario "the user sees a registration form" do 
			visit "/users/new"
			expect(page).to have_field("user[first_name]") 
		end

	end 

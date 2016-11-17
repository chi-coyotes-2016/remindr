require "rails_helper"

feature "creating a reminder" do 
	let(:user) { User.create(	user_name: "dummy",
														first_name: "dummy",
														last_name: "user",
														email: "dummy@dummy.dumb",
														password: "12345678",
														phone_number: "+16145551234")}
	before(:each) do
		visit root_path
		click_link "Login"
		fill_in "session_user_name", with: user.user_name
		fill_in "session_password", with: user.password
		click_button "Login"
	end

	scenario "user has logged in and has access to new reminder form" do
		expect(page).to have_link("Create Reminder")
	end

	xscenario "create reminder button renders create reminder form" do
		click_link "Create Reminder"
		expect(view).to render_template("reminders/new")
	end

	xscenario "create reminder form contains ..." do
		click_link "Create Reminder"
	end

	
	
end
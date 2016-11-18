
task :send_sms => :environment do
	reminders = Reminder.where("time_to_go_out < ?", (Time.now.utc + 541))
	reminders.each do | reminder |
		reminder.send_sms
	end
end

class Reminder < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :recipients
  has_many :contacts, through: :recipients
  validates :number_of_recurrences, numericality: { greater_than_or_equal_to: 0, message: "must be at least 0" }
  validates :author, presence: true

  def central_time
    (self.time_to_go_out - 21600).strftime('%Y-%m-%dT%H:%M:%S')
  end

  def human_central_time
    (self.time_to_go_out - 21600).strftime("%B %-m, %Y %H:%M")
  end

  def send_sms
  	client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_AUTH_TOKEN"]
  	reminder = self
  	reminder.contacts.each do | contact |
	  	client.messages.create(
	  		from: '+19293684474',
	  		to: "+1#{contact.phone_number}",
	  		body: reminder.body
	  		)
	  end
	  if self.number_of_recurrences == 0
	  	self.destroy
	  else
	  	old_time = self.time_to_go_out
	  	self.number_of_recurrences -= 1
	  	case self.time_of_recurrence
	  	when 'every ten minutes'
	  		self.time_to_go_out = old_time + 600
	  	when 'hourly'
	  		self.time_to_go_out = old_time + 3600
	  	when 'every 6 hours'
	  		self.time_to_go_out = old_time + 21600
	  	when 'every 12 hours'
	  		self.time_to_go_out = old_time + 43200
	  	when 'daily'
	  		self.time_to_go_out = old_time + 86400
	  	when 'weekly'
	  		self.time_to_go_out = old_time + 604800
	  	end
	  	self.save
	  end
  end
end

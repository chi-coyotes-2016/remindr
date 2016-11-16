class Reminder < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  has_many :recipients
  has_many :contacts, through: :recipients

end

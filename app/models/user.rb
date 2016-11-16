class User < ActiveRecord::Base
  has_many :reminders, foreign_key: :author_id
  has_many :contacts
  has_many :groups

  has_secure_password

end

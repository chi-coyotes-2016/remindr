class User < ActiveRecord::Base
  has_many :reminders, foreign_key: :author_id
  has_many :contacts
  has_many :groups

  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/, message: "must be a valid email address"},
                    uniqueness: {message: "already taken"}

  has_secure_password

end

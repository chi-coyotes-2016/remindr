class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :groupings
  has_many :groups, through: :groupings
  has_many :recipients
  has_many :reminders, through: :recipients
  validates :user, presence: true

end

class Recipient < ActiveRecord::Base
  belongs_to :reminder
  belongs_to :contact
  validates :reminder, presence: true
  validates :contact, presence: true

end

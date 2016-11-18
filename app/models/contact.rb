class Contact < ActiveRecord::Base
  belongs_to :user
  has_many :groupings
  has_many :groups, through: :groupings
  has_many :recipients
  has_many :reminders, through: :recipients
  validates :user, presence: true
  validate :valid_phone_number

  def valid_phone_number
    if !/\A\d{10}\z/.match(self.phone_number)
      errors.add(:phone_number, "must be 10 digits")
    elsif self.phone_number.to_s[0] == "0" || self.phone_number.to_s[0] == "1" || self.phone_number.to_s[1..2] == "11"
      errors.add(:phone_number, "has an invalid area code")
    elsif self.phone_number.to_s[3] == "0" || self.phone_number.to_s[3] == "1" || self.phone_number.to_s[4..5] == "11"
      errors.add(:phone_number, "is invalid")
    end
  end

end

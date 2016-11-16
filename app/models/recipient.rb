class Recipient < ActiveRecord::Base
  belongs_to :reminder
  belongs_to :contact

end

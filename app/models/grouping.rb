class Grouping < ActiveRecord::Base
  belongs_to :group
  belongs_to :contact
  validates :group, presence: true
  validates :contact, presence: true

end

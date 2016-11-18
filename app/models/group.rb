class Group < ActiveRecord::Base
  has_many :groupings
  has_many :contacts, through: :groupings
  belongs_to :user
  validates :user, presence: true


end

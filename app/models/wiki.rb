class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history
  #belongs_to :user

  has_many :collaborators
  has_many :users, through: :collaborators
  
  validates :title, presence: true

end
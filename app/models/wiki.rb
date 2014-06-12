class Wiki < ActiveRecord::Base
  #belongs_to :user

  has_many :collaborators
  has_many :users, through: :collaborators
  
  validates :title, presence: true

end
class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history

  scope :public_wikis, ->{where(pubilc: true)}
  scope :private_wikis, ->{where(pubilc: false)}

  #belongs_to :user

  has_many :collaborators
  has_many :users, through: :collaborators
  
  validates :title, presence: true

  def not_users
    User.not_collaborator_on(self)
  end

end
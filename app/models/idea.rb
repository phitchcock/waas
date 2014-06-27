class Idea < ActiveRecord::Base
  extend FriendlyId

  include PublicActivity::Common
  #tracked owner: Proc.new{ |controller, model| controller.current_user }

  friendly_id :title, use: :history

  scope :public_ideas, ->{where(public: true)}
  scope :private_ideas, ->{where(public: false)}

  #belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :screens, dependent: :destroy
  has_many :collaborators
  has_many :users, through: :collaborators
  
  validates :title, presence: true

  def not_users
    User.not_collaborator_on(self)
  end

end

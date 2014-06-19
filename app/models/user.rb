class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # has_many :ideas
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  #has_many :votes, dependent: :destroy
  
  has_many :collaborators
  has_many :ideas, through: :collaborators

  # def role?(base_role)
  #   role == base_role.to_s
  # end
  
  enum role: [:guest, :premium, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :guest
  end

 scope :not_collaborator_on, ->(idea){ joins("LEFT JOIN collaborators ON users.id = collaborators.user_id AND collaborators.idea_id = #{idea.id}").where(collaborators: {user_id: nil}) }

end





class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # has_many :wikis
  has_many :comments
  has_many :collaborators
  has_many :wikis, through: :collaborators

  # def role?(base_role)
  #   role == base_role.to_s
  # end
  
  enum role: [:guest, :premium, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :guest
  end

 scope :not_collaborator_on, ->(wiki){ joins("LEFT JOIN collaborators ON users.id = collaborators.user_id AND collaborators.wiki_id = #{wiki.id}").where(collaborators: {user_id: nil}) }

end





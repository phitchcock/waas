class User < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader

  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
         
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

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.find_for_facebook_oauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.avatar = auth.info.avatar # assuming the user model has an image
    end
  end

 scope :not_collaborator_on, ->(idea){ joins("LEFT JOIN collaborators ON users.id = collaborators.user_id AND collaborators.idea_id = #{idea.id}").where(collaborators: {user_id: nil}) }

end





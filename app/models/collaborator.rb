class Collaborator < ActiveRecord::Base
  
  include PublicActivity::Common

  belongs_to :user
  belongs_to :idea

  enum role: %w(owner editor guest)

  after_validation :set_default_role

  def set_default_role
    self.role ||= :guest
  end

  validates_uniqueness_of :user_id, scope: :idea_id
end

class Collaborator < ActiveRecord::Base

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  belongs_to :user
  belongs_to :idea

  enum role: %w(owner editor guest)

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :owner
  end

  validates_uniqueness_of :user_id, scope: :idea_id
end

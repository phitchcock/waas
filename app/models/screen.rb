class Screen < ActiveRecord::Base
  extend FriendlyId

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }
  
  friendly_id :title, use: :history
  belongs_to :idea
  validates :title, presence: true
  validates :body, presence: true
end
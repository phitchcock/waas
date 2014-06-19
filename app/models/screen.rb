class Screen < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history
  belongs_to :idea
  validates :title, presence: true
  validates :body, presence: true
end
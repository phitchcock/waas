class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history
  has_many :comments
  belongs_to :wiki
end
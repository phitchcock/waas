class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :wiki
end
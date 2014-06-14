class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :history
  belongs_to :wiki
end
class Bookmark < ActiveRecord::Base

  include PublicActivity::Common
  
  belongs_to :idea
  belongs_to :user

  validates :title, presence: true
end
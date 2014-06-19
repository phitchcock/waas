class Bookmark < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

  validates :title, presence: true
end
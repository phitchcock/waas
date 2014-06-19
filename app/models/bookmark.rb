class Bookmark < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user

  validates :title, presence: true
end
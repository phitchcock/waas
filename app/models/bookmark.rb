class Bookmark < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :title, presence: true
end
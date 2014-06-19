class Comment < ActiveRecord::Base
  belongs_to :wiki
  belongs_to :user

  validates :info, presence: true
end
class Comment < ActiveRecord::Base
  belongs_to :idea
  belongs_to :user

  #has_many :votes, dependent: :destroy

  validates :info, presence: true

  acts_as_votable
  # def up_votes
  #   self.votes.where(value: 1).count
  # end

  # def down_votes
  #   self.votes.where(value: -1).count
  # end

  # def points
  #   self.votes.sum(:value).to_i
  # end
  
end
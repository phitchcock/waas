class Comment < ActiveRecord::Base

  include PublicActivity::Common

  acts_as_tree order: 'created_at DESC'
  
  belongs_to :idea
  belongs_to :user

  #has_many :votes, dependent: :destroy

  validates :body, presence: true

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
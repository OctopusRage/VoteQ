class VoteOption < ActiveRecord::Base
  belongs_to :vote
  has_many :user_votes
end

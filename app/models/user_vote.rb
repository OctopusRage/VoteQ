class UserVote < ActiveRecord::Base
  belongs_to :user, inverse_of: :user_votes
  belongs_to :vote, inverse_of: :user_votes
  belongs_to :vote_option
  validates :user_id, uniqueness: { scope: :vote_id }, presence: true
  validates :vote_id, presence: true
  validates :vote_option_id, presence: true
  validates_with CheckVoteOptionValidator

end

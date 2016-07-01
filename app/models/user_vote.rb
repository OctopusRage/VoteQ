class UserVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :vote
  belongs_to :vote_option
  validates :user_id, uniqueness: { scope: :vote_id }
end

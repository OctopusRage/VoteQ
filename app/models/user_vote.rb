class UserVote < ActiveRecord::Base
  belongs_to :user
  belongs_to :vote
  belongs_to :vote_option
end

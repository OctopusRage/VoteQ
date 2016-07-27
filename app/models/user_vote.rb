class UserVote < ActiveRecord::Base
  belongs_to :user, inverse_of: :user_votes
  belongs_to :vote, inverse_of: :user_votes
  belongs_to :vote_option
  validates :user_id, uniqueness: { scope: :vote_id }, presence: true
  validates :vote_id, presence: true
  validates :vote_option_id, presence: true
  validates_with CheckVoteOptionValidator
  validates :available, inclusion: [true]

  def get_opt_id
    vote_option_id
  end

  def available
  	return  self.vote.status
  end 

  def as_json(options={})
	{
		id: id,
		user: user,
		vote: vote,
		choosen_option: vote_option,
		created_at: created_at,
		updated_at: updated_at
	}
  end
end

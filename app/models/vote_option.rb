class VoteOption < ActiveRecord::Base
  belongs_to :vote, inverse_of: :vote_options
  has_many :user_votes

  def voter_count
  	user_votes.count
  end

  def voter_count_as_percent
  	if vote.voter_count == 0
  		0
  	else
  		'%.2f' % (voter_count.to_f*100.to_f/vote.voter_count.to_f)
  	end
  end


  def as_json(options={})
  	{
  		id: id, 
  		title: title,
  		count: voter_count,
  		percentage: voter_count_as_percent,
  		vote_id: vote_id
  	}
  end
end

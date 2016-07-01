class VoteOption < ActiveRecord::Base
  belongs_to :vote
  has_many :user_votes


  def as_json(options={})
  	{
  		id: id, 
  		title: title,
  		vote_id: vote_id
  	}
  end
end

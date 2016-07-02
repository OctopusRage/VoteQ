class CheckVoteOptionValidator < ActiveModel::Validator
  def validate(record)
  	if record.vote_option_id
	  	
	  	vote = Vote.find(record.vote_id).vote_options
    	if (vote = vote.where(id: record.vote_option_id).exists?) == false
    		record.errors["vote options"] << "vote option doesnt belongs to this vote"
    	end
    end
  end
end

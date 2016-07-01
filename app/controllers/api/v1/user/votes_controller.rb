class Api::V1::User::VotesController < UserController
	before_action :authenticate_with_token!, only: [:create]
	
	def create
		vote = current_user.votes.build(votes_params)
		vote.generate_vote_options(params[:options])
		if vote.save			
			render json: {
				status: 'success', 
				data: {
					vote: vote
				}
			}, status: 201
		else
			render json: {
				status: 'fail', 
				data: vote.errors
			}, status: 422
		end
	end

	def votes_params
		params.permit(:title)
	end
end
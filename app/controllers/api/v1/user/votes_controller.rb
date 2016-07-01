class Api::V1::User::VotesController < UserController
	before_action :authenticate_with_token!, only: [:create, :destroy]
	
	def create
		vote = current_user.vote.build(votes_params)
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
		params.require(:vote).permit(:title, :options => [])
	end
end
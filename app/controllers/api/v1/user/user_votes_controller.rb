class Api::V1::User::UserVotesController < UserController
	before_action :authenticate_with_token!, only: [:create, :update, :index, :show]
	def create
		user_vote = current_user.user_votes.build(user_votes_params)
		if user_vote.save
			render json: {
				status: "success", 
				data: {
					user_vote: user_vote
				}
			}, status: 201
		else
			render json: {
				status: "fail", 
				data: user_vote.errors
			}, status: 422
		end
	end
		
	def update
		user_vote = current_user.user_votes.find(params[:id]) 
		if user_vote.update(user_votes_params)
			render json: {
				status: "success", 
				data: {
					user_vote: user_vote
				}
			}, status: 200
		else
			render json: {
				status: "fail", 
				data: user_vote.errors
			}, status: 422
		end
	end

	def user_votes_params
		params.permit(:vote_id, :vote_option_id)
	end	
end

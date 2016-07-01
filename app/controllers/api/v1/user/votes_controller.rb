class Api::V1::User::VotesController < UserController
	before_action :authenticate_with_token!, only: [:create, :update, :index, :show]
	
	def index
		is_current_user = params[:current_user]
		if is_current_user == "true"
			votes = current_user.votes.all
		else
			votes = Vote.desc
		end
		render json:{
			status: 'OK',
			data: {
				vote: votes
			}
		}, status: 200
	end

	def create
		vote = current_user.votes.build(title: params[:title])
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
	
	def show
		vote = Vote.find(params[:id])
		render json:{
			status: 'OK',
			data: {
				vote: vote
			}
		},  status: 200
	end
end
class Api::V1::User::VotesController < UserController
	before_action :authenticate_with_token!, only: [:create, :update, :index, :show]
	
	def index
		is_current_user = params[:current_user]
		if is_current_user == "true"
			votes = current_user.votes.all
		else
			votes = Vote.desc
		end

		if params[:status] == "open"
			votes = votes.open
		elsif params[:status] == "closed"
			votes = votes.closed
		end

		render json:{
			status: 'OK',
			data: {
				total: votes.count,
				vote: votes
			}
		}, status: 200
	end

	def create
		is_open = params[:is_open]
		vote = current_user.votes.build(title: params[:title], status: params[:is_open])
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

	def update
		vote = current_user.votes.find(params[:id])
		if vote.update(title: params[:title], status: params[:is_open])
			render json: {
				status: 'success', 
				data: {
					vote: vote
				}, status: 200
			}
		else
			render json: {
				status: 'error',
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
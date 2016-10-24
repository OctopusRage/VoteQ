class Api::V1::User::VoteCategoriesController < UserController
  def index
    vote_categories = VoteCategory.all()
    render json: {
      status: 200,
      data: {
        categories: vote_categories
      }, status: 200
    }
  end
end

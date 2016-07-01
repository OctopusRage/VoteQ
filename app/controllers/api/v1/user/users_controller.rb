class Api::V1::User::UsersController < UserController
	before_action :authenticate_with_token!, only: [:update, :destroy]
	def create
		user = User.new(users_params)
		if user.valid_password? users_params[:password]
			user.generate_authentication_token!
			if user.save
				render json: {
					status: 'success',
					data: {
						user: user
					}
				}, status: 201
			else
				render json: {
					status: 'error',
					data: user.errors,
				}, status: 422
			end
		else
			render json: {
				status: 'error',
				data: user.errors,
			}, status: 422
		end
	end	

	def users_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end

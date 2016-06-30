class Api::V1::Admin::UsersController < AdminController
	respond_to :json
	def create
		user = User.new(user_params)
		if user.valid_password? user_params(user['password'])
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

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
end

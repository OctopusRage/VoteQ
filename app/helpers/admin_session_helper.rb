module AdminSessionHelper
  def current_admin
    @current_admin ||= Admin.find_by(auth_token: request.headers['Authorization'])
  end	
	def authenticate_with_token!
		render json: { errors: "Not authenticated" },
		        status: :unauthorized unless current_admin.present?
	end    
end
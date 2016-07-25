class Api::V1::User::ForgotPasswordController < UserController
  before_action :authenticate_with_token!
  def create
    if current_user.forgot_code != nil
      if forgot_password_params[:forgot_code] == current_user.forgot_code
        if (reset = current_user.reset_password(forgot_password_params[:password], forgot_password_params[:password_confirmation]))
          current_user.update!(forgot_code: nil)
          render json: {
            status: 'success',
            data: {
              user: current_user
            }, status: 200
          }
        else
          render json: {
            status: 'fail',
            messages: 'reset password has failed'
          }, status: 422
        end  
      else
        render json: {
          status: 'fail',
          messages: 'reset password has failed'
        }, status: 422
      end
    else
      render json: {
        status: 'fail',
        messages: 'reset password has failed'
      }, status: 422
    end
  end

  def forgot_password_params
    params.permit(:password, :password_confirmation, :forgot_code)
  end
end
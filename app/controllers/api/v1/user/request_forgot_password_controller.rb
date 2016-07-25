require 'mailgun'
class Api::V1::User::RequestForgotPasswordController < UserController
  def create
    secret_api = "key-8b77de645aa97be26916a4b26590eccf"
    public_api = "pubkey-949492e5d20483e2b393c56147445cae"
    if (user = User.where(email: request_forgot_password_params[:email])).exists?
      user = user.first
      code = self.generate_reset_code
      user.update!(forgot_code: code)
      if UserMailer.forgot_password(user).deliver
        render json: {
          status: 'success',
          messages: "email has been sent"
        }, status: 200
      else
        render json: {
          status: 'fail',
          messages: 'reset password has failed'
        }, status: 422
      end
    else
      render json: {
        status: 'fail',
        messages: 'email not found'
      }, status: 422
    end
  end

  def generate_reset_code
    ((0...4).map { (65 + rand(26)).chr }.join).to_s
  end

  def request_forgot_password_params
    params.permit(:email)
  end
end
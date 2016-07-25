class UserMailer < ApplicationMailer
	default from: "admin@voteq.com"
	def forgot_password(user)
    @user = user
    mail(to: @user.email, subject: 'Forgot Password')
	end

end

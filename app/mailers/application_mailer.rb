class ApplicationMailer < ActionMailer::Base
  default from: "admin@voteq.com"
  layout 'mailer'
end
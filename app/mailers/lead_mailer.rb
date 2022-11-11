class LeadMailer < ActionMailer::Base
  layout 'mailer'
  default from: ''
  default to: ''

  def user_information_email(user)
    @user = user

    mail subject: "Hi", &:text
  end
end

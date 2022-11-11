class LeadMailer < ActionMailer::Base
  layout 'mailer'
  default from: I18n.t('lead_mailer.from')
  default to: I18n.t('lead_mailer.to')

  def user_information_email(user)
    @user = user

    mail subject: "A new dripart lead called: #{user.name} - #{user.phone_number}", &:text
  end
end

require 'rails_helper'

RSpec.describe LeadMailer, type: :mailer do
  describe 'user_information_email' do
    let(:user) { create(:user) }
    let(:mail) { described_class.user_information_email(user).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq("A new dripart lead called: #{user.name} - #{user.phone_number}")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq([I18n.t('lead_mailer.to')])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq([I18n.t('lead_mailer.from')])
    end

    it 'assigns @user.phone_number' do
      # Adding \\ to escape the plus symbol prefixing the phone number
      expect(mail.body.encoded).to match("\\#{user.phone_number}")
    end

    it 'assigns @user.availability' do
      expect(mail.body.encoded).to match(user.availability)
    end

    it 'assigns @user.house_description' do
      expect(mail.body.encoded).to match(user.house_description)
    end

    it 'assigns @user.art_style' do
      expect(mail.body.encoded).to match(user.art_style)
    end
  end
end

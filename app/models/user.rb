class User < ActiveRecord::Base
  validates :name, presence: true
  validates :phone_number, presence: true
  validates :availability, presence: true

  def send_lead
    LeadMailer.user_information_email(self).deliver_later
  end
end

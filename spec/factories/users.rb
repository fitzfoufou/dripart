FactoryBot.define do
  factory :user do
    name { 'James' }
    phone_number { I18n.t('helpers.placeholder.user.phone_number') }
    availability { I18n.t('helpers.placeholder.user.availability') }
    house_description { I18n.t('helpers.placeholder.user.house_description') }
    art_style { I18n.t('helpers.placeholder.user.art_style') }
  end
end

# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validations' do
    before(:all) do
      @user = create(:user)
    end

    it 'is valid with valid attributes' do
      expect(@user).to be_valid
    end

    context 'when missing an attribute' do
      it 'is not valid without a name' do
        @user.name = nil
        expect(@user).to_not be_valid
        @user.name = 'James'
      end
      it 'is not valid without a phone number' do
        @user.phone_number = nil
        expect(@user).to_not be_valid
        @user.phone_number = I18n.t('helpers.placeholder.user.phone_number')
      end
      it 'is not valid without availabilities' do
        @user.availability = nil
        expect(@user).to_not be_valid
        @user.availability = I18n.t('helpers.placeholder.user.availability')
      end
    end

    context 'when adding wrong formated attributes' do
      it 'is not valid with a blank name' do
        @user.name = ''
        expect(@user).to_not be_valid
        @user.name = 'James'
      end
      it 'is not valid with a blank phone number' do
        @user.phone_number = ''
        expect(@user).to_not be_valid
        @user.phone_number = I18n.t('helpers.placeholder.user.phone_number')
      end
      it 'is not valid with blank availabilities' do
        @user.availability = ''
        expect(@user).to_not be_valid
        @user.availability = I18n.t('helpers.placeholder.user.availability')
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength

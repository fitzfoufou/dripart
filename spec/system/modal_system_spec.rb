require 'capybara/rspec'
require 'rails_helper'

describe 'the lead form modal', type: :system, js: true do
  before do
    driven_by :selenium, using: :chrome, screen_size: [1400, 1400], options: {
      browser: :remote,
      url: 'http://chrome-server:4444'
    }
  end

  context 'when go to root page' do
    before do
      visit '/'
    end

    ['home', 'process', 'team'].each do |section|
      context "when click on #{section} section's CTA button" do
        before do
          within("##{section}") do
            click_button 'Be called back'
          end
        end
        it 'opens the lead form modal with the correct title' do
          within('#cta-modal') do
            expect(page).to have_content I18n.t('cta_modal.title')
          end
        end
      end
    end
  end
end

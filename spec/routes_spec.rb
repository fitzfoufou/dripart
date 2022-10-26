require 'rails_helper'

RSpec.describe 'routes', type: :routing do
  it "routes root to pages controller's main method" do
    expect(get('/')).to route_to('pages#main')
  end
end

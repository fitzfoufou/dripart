require 'rails_helper'

RSpec.describe 'routes', type: :routing do
  it "routes root to pages controller's main method" do
    expect(get('/')).to route_to('pages#main')
  end
  describe 'Users controller routes' do
    it 'routes /users/new to relevant controller method' do
      expect(get('/users/new')).to route_to('users#new')
    end

    it 'routes /users/new to relevant controller method' do
      expect(post('/users')).to route_to('users#create')
    end

    it 'routes /users with get to users#new' do
      expect(get('/users')).to route_to('users#new')
    end
  end
end

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Users' do
    it 'returns http success, Correct Body , Correct Template' do
      get '/users/index'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('User List Here')
      expect(response).to render_template(:index)
    end

    it 'returns http success, Correct Body , Correct Template' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('User List Here')
      expect(response).to render_template(:index)
    end
  end
end

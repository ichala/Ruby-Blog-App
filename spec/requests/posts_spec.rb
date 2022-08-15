require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Posts' do
    it 'returns http success, Correct Body , Correct Template' do
      get '/users/id/posts'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('HERE USER POSTS')
      expect(response).to render_template(:posts)
    end

    it 'returns http success, Correct Body , Correct Template' do
      get '/users/id/posts/id'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('HERE A SINGLE POST')
      expect(response).to render_template(:post)
    end
  end
end

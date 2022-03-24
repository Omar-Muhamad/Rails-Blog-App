require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/:user_id/posts' }
    it 'the request is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'Renders the right template' do
      expect(response).to render_template('index')
    end
    it 'Include the correct text' do
      expect(response.body).to include('Here is all Posts for certain user')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/:user_id/posts/:id' }
    it 'the request is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'Renders the right template' do
      expect(response).to render_template('show')
    end
    it 'Include the correct text' do
      expect(response.body).to include('Here is a single post for certain user')
    end
  end
end

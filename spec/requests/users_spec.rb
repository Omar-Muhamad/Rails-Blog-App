require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before(:example) { get '/users' }
    it "the request is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "Renders the right template" do
      expect(response).to render_template('index')
    end
    it "Include the correct text" do
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe "GET /show" do
    before(:example) { get '/users/:id' }
    it "the request is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "Renders the right template" do
      expect(response).to render_template('show')
    end
    it "Include the correct text" do
      expect(response.body).to include('Here is data and posts for certain user')
    end
  end
end

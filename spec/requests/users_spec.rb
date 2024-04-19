require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      user = User.create!(first_name: "Rodrigo", email: "rcarmona@example.com", password: "password")
      get "/users/#{user.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      post "/users", params: { user: { first_name: "Gonzalo", last_name: "Carmona", email: "gcarmona@example.com", password: "password" } }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      user = User.create!(first_name: "Rodrigo", email: "rcarmona@example.com", password: "password")
      patch "/users/#{user.id}", params: { user: { first_name: "Rodrigo Carmona" } }
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      user = User.create!(first_name: "Gonzalo", email: "gcarmona@example.com", password: "password")
      delete "/users/#{user.id}"
      expect(response).to redirect_to(users_path)
    end
  end

end

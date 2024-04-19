require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "POST /users" do
    it "creates a new user" do
      expect {
        post "/users", params: { user: { first_name: "Rodrigo", last_name: "Carmona", email: "rcarmona@example.com", password: "password" } }
      }.to change(User, :count).by(1)
    end
  end
end


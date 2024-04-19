require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "PATCH /users/:id" do
    it "updates an existing user" do
      user = User.create!(first_name: "Rodrigo", email: "rcarmona@example.com", password: "password")
      patch "/users/#{user.id}", params: { user: { first_name: "Gonzalo" } }
      
      user.reload
      expect(user.first_name).to eq("Gonzalo")
      expect(response).to redirect_to(user)
    end
  end
end

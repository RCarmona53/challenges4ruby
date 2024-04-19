RSpec.describe "Users", type: :request do
  describe "DELETE /users/:id" do
    it "deletes an existing user and redirects to users index" do
      user = User.create!(first_name: "Rodrigo", email: "rodrigo@example.com", password: "password")
      delete "/users/#{user.id}"
      
      expect(response).to redirect_to(users_path)
    end
  end
end

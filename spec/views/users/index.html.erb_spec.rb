require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(first_name: "Rodrigo", email: "rodrigo@example.com", password: "password"),
      User.create!(first_name: "Gonzalo", email: "gonzalo@example.com", password: "password")
    ])
  end

  it "renders a list of users" do
    render
    expect(rendered).to match /Rodrigo/
    expect(rendered).to match /Gonzalo/
  end
end

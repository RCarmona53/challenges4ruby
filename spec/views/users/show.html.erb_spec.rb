require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(first_name: "Rodrigo", email: "rodrigo@example.com", password: "password"))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match /Rodrigo/
  end
end

require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
  end

  describe "factory" do
    it "is valid" do 
      product = FactoryBot.build(:product)
      expect(product).to be_valid
    end
  end
end
require 'rails_helper'

RSpec.describe Provider, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:phone) }
  end

  describe 'factory' do
    it 'is valid' do
      provider = FactoryBot.build(:provider)
      expect(provider).to be_valid
    end
  end
end

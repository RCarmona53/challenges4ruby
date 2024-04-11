require 'rails_helper'

RSpec.describe Hospital, type: :model do
    describe 'validations' do
        it { should validate_presence_of(:name) }
        it { should validate_presence_of(:address) }
        it { should validate_presence_of(:city) }
        it { should validate_presence_of(:state) }
        it { should validate_presence_of(:zipcode) }
    end

    describe "factory" do 
        it "is valid" do
            hospital = FactoryBot.build(:hospital)
            expect(hospital).to be_valid
        end
    end
end
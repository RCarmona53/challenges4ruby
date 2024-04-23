require 'rails_helper'

RSpec.describe HospitalsController, type: :controller do
    describe "GET #index" do
        it "returns a success response" do 
            get :index
            expect(response).to be_successful
        end
    end

    describe "GET #show" do 
        it "returns a success response" do 
            hospital = Hospital.create!(name: "Hospital", address: "BsAs 1989", city: "BSAS", state: "CABA", zipcode: "1928")
            get :show, params: { id: hospital.to_param }
            expect(response).to be_successful
        end
    end

    describe "POST #create" do 
        it "creates a new hospital" do
            expect{ 
                post :create, params: { hospital: { name: "Hospital", address: "BsAs 1989", city: "BSAS", state: "CABA", zipcode: "1928" }}
            }.to change(Hospital, :count).by(1)
            expect(response).to have_http_status(:created)
        end
    end

    describe "PATCH #update" do
        it "updates the requested hospital" do
          hospital = Hospital.create!(name: "Hospital", address: "BsAs 1989", city: "BSAS", state: "CABA", zipcode: "1928")
          patch :update, params: { id: hospital.to_param, hospital: { name: "Updated Hospital" } }
          hospital.reload
          expect(hospital.name).to eq("Updated Hospital")
        end
      end
    
      describe "DELETE #destroy" do
        it "destroys the requested hospital" do
          hospital = Hospital.create!(name: "Hospital", address: "BsAs 1989", city: "BSAS", state: "CABA", zipcode: "1928")
          expect {
            delete :destroy, params: { id: hospital.to_param }
          }.to change(Hospital, :count).by(-1)
        end
      end
end

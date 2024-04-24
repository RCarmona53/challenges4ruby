require 'rails_helper'

RSpec.describe ProvidersController, type: :controller do
  let(:valid_attributes) {
    { name: 'Provider Name', address: 'Provider Address', phone: '1234567890' }
  }

  let(:invalid_attributes) {
    { name: nil, address: nil, phone: nil }
  }

  describe "GET #index" do
    it "returns a success response" do
      provider = Provider.create!(valid_attributes)
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      provider = Provider.create!(valid_attributes)
      get :show, params: { id: provider.to_param }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Provider" do
        expect {
          post :create, params: { provider: valid_attributes }
        }.to change(Provider, :count).by(1)
      end

      it "renders a JSON response with the new provider" do
        post :create, params: { provider: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(response.content_type.split(';').first).to eq('application/json')
        expect(response.location).to eq(provider_url(Provider.last))
      end
    end

    context "with invalid params" do
      it "renders a JSON response with errors for the new provider" do
        post :create, params: { provider: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type.split(';').first).to eq('application/json')
      end
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:new_attributes) {
        { name: 'New Provider Name' }
      }

      it "updates the requested provider" do
        provider = Provider.create!(valid_attributes)
        patch :update, params: { id: provider.to_param, provider: new_attributes }
        provider.reload
        expect(provider.name).to eq('New Provider Name')
      end

      it "renders a JSON response with the provider" do
        provider = Provider.create!(valid_attributes)
        patch :update, params: { id: provider.to_param, provider: valid_attributes }
        expect(response).to have_http_status(:ok)
        expect(response.content_type.split(';').first).to eq('application/json')
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested provider" do
      provider = Provider.create!(valid_attributes)
      expect {
        delete :destroy, params: { id: provider.to_param }
      }.to change(Provider, :count).by(-1)
    end
  end
end

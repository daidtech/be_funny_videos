require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :controller do
  let(:user) { build(:user) }

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new user and returns a success response' do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        post :create, params: { user: { email: user.email, password: user.password, password_confirmation: user.password } }, format: :json
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['status']['message']).to eq('Signed up successfully.')
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new user and returns an error response' do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        post :create, params: { user: { email: '', password: '', password_confirmation: '' } }, format: :json
        expect(response).to have_http_status(422)
        expect(JSON.parse(response.body)['status']['error']).not_to be_nil
      end
    end
  end

end
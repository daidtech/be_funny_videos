require 'rails_helper'

RSpec.describe Users::SessionsController, type: :controller do
  let(:user) { create(:user) }

  describe '#current_token' do
    context 'when user is logged in' do
      before do
        sign_in user
        allow(request.env).to receive(:[]).with('warden-jwt_auth.token').and_return('test_token')
      end

      it 'returns the current token' do
        expect(controller.send(:current_token)).to eq('test_token')
      end
    end

    context 'when user is not logged in' do
      it 'returns nil' do
        expect(controller.send(:current_token)).to be_nil
      end
    end
  end

  describe 'POST #create' do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:user]
    end

    context 'with valid credentials' do
      it 'returns a success response' do
        post :create, params: { user: { email: user.email, password: user.password } }, format: :json
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['message']).to eq('Logged in successfully.')
      end
    end

    context 'with invalid credentials' do
      it 'returns an unauthorized response' do
        post :create, params: { user: { email: user.email, password: 'wrong_password' } }, format: :json
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).not_to be_nil
      end
    end
  end

end

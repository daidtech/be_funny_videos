require 'rails_helper'

RSpec.describe Users::CurrentUserController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET #show' do
    context 'when user is logged in' do
      before do
        sign_in user
      end

      it 'returns the current user' do
        get :show, format: :json
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['id']).to eq(user.id)
      end
    end

    context 'when user is not logged in' do
      it 'returns an unauthorized response' do
        get :show, format: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
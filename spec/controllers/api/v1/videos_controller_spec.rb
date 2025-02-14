require 'rails_helper'

RSpec.describe Api::V1::VideosController, type: :controller do
  let(:user) { create(:user) }
  let(:video) { create(:video, user: user) }

  context 'when user is not logged in' do
    describe 'GET #index' do
      it 'returns a list video' do
        get :index, format: :json
        expect(response).to have_http_status(:ok)
      end
    end
    describe 'POST #create' do
      it 'returns a unauthorized' do
        post :create, format: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
    describe 'DELETE #destroy' do
      before do
        @video = create(:video, user: user)
      end

      it 'destroys the requested video but not change' do
        expect {
          delete :destroy, params: { id: @video.id }, format: :json
        }.to change(Video, :count).by(0)
      end
    end
  end

  context 'when user is logged in' do
    before do
      sign_in user
    end

    describe 'GET #index' do
      it 'returns a success response' do
        get :index, format: :json
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to be_an_instance_of(Array)
      end
    end

    describe 'POST #create' do
      context 'with valid parameters' do
        let(:valid_attributes) { { title: 'Test Video', description: 'Test Description', youtube_video_hash: 'abc123' } }

        it 'creates a new video' do
          expect {
            post :create, params: { video: valid_attributes }, format: :json
          }.to change(Video, :count).by(1)
        end

        it 'returns a created status' do
          post :create, params: { video: valid_attributes }, format: :json
          expect(response).to have_http_status(:created)
        end
      end

      context 'with invalid parameters' do
        let(:invalid_attributes) { { title: '', description: '', youtube_video_hash: '' } }

        it 'does not create a new video' do
          expect {
            post :create, params: { video: invalid_attributes }, format: :json
          }.not_to change(Video, :count)
        end

        it 'returns an unprocessable entity status' do
          post :create, params: { video: invalid_attributes }, format: :json
          expect(response).to have_http_status(422)
        end
      end
    end

    describe 'DELETE #destroy' do
      before do
        @video = create(:video, user: user)
      end

      it 'destroys the requested video' do
        expect {
          delete :destroy, params: { id: @video.id }, format: :json
        }.to change(Video, :count).by(-1)
      end

      it 'returns a no content status' do
        delete :destroy, params: { id: @video.id }, format: :json
        expect(response).to have_http_status(:no_content)
      end

      it 'returns not found status if video does not exist' do
        delete :destroy, params: { id: 'nonexistent_id' }, format: :json
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['error']).to eq('Video not found')
      end
    end
  end
end
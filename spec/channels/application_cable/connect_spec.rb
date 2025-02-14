require 'rails_helper'

module ApplicationCable
  RSpec.describe Connection, type: :channel do
    let(:user) { create(:user) }
    let(:token) { Warden::JWTAuth::UserEncoder.new.call(user, :user, nil) }

    context 'when token is valid' do
      before do
        allow_any_instance_of(Connection).to receive(:find_verified_user).and_return(user)
      end
      it 'successfully connects' do
        connect '/cable', params: { token: token[0] }
        expect(connection.current_user).to eq(user)
      end
    end

    context 'when token is invalid' do
      it 'rejects connection' do
        allow_any_instance_of(Warden::JWTAuth::UserDecoder).to receive(:call).and_return(nil)
        expect { connect '/cable', params: { token: 'invalid_token' } }.to have_rejected_connection
      end
    end
  end
end
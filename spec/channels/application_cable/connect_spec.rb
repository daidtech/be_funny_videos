require 'rails_helper'

module ApplicationCable
  RSpec.describe Connection, type: :channel do
    let(:user) { create(:user) }
    let(:token) { Warden::JWTAuth::UserEncoder.new.call(user, :user, nil) }
    let(:env) { instance_double('env', 'warden-jwt_auth.token' => token[0]) }
    let(:request) { instance_double('request', params: { token: token[0] }, env: env) }

    before do
      allow_any_instance_of(Connection).to receive(:request).and_return(request)
    end

    context 'when token is valid' do
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
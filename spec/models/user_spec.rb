require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    it 'is valid with valid attributes' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'is not valid without an email' do
      user = build(:user, email: nil)
      expect(user).not_to be_valid
    end

    it 'is not valid without a password' do
      user = build(:user, password: nil)
      expect(user).not_to be_valid
    end
  end
  describe 'association' do
    it 'has many videos' do
      user = create(:user)
      video1 = create(:video, user: user)
      video2 = create(:video, user: user)
      expect(user.videos).to include(video1, video2)
    end

    it 'destroys associated videos when user is destroyed' do
      user = create(:user)
      create(:video, user: user)
      expect { user.destroy }.to change { Video.count }.by(-1)
    end
  end
end

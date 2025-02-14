require 'rails_helper'

RSpec.describe Video, type: :model do
  let(:user) { create(:user) }
  let(:valid_attributes) do
    {
      title: 'Funny Video',
      description: 'A very funny video',
      youtube_video_hash: 'abc123',
      user: user
    }
  end

  describe 'validation' do
    context 'when video is valid' do
      it 'is valid with valid attributes' do
        video = Video.new(valid_attributes)
        expect(video).to be_valid
      end

      it 'is valid with a title of 200 characters' do
        valid_title = 'a' * 200
        video = Video.new(valid_attributes.merge(title: valid_title))
        expect(video).to be_valid
      end

      it 'is valid with a description of 500 characters' do
        valid_description = 'a' * 500
        video = Video.new(valid_attributes.merge(description: valid_description))
        expect(video).to be_valid
      end


    end

    context 'when video is not valid' do
      it 'is not valid with a title longer than 200 characters' do
        long_title = 'a' * 201
        video = Video.new(valid_attributes.merge(title: long_title))
        expect(video).to_not be_valid
      end

      it 'is not valid with a description longer than 500 characters' do
        long_description = 'a' * 501
        video = Video.new(valid_attributes.merge(description: long_description))
        expect(video).to_not be_valid
      end

      it 'is not valid without a title' do
        video = Video.new(valid_attributes.except(:title))
        expect(video).to_not be_valid
      end

      it 'is not valid without a description' do
        video = Video.new(valid_attributes.except(:description))
        expect(video).to_not be_valid
      end

      it 'is not valid without a youtube_video_hash' do
        video = Video.new(valid_attributes.except(:youtube_video_hash))
        expect(video).to_not be_valid
      end

      it 'is not valid with a duplicate youtube_video_hash' do
        Video.create(valid_attributes)
        video = Video.new(valid_attributes)
        expect(video).to_not be_valid
      end
    end
  end

  describe 'associations' do
    it 'belongs to a user' do
      video = Video.new(valid_attributes)
      expect(video.user).to eq(user)
    end
  end
end


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

  it 'is valid with valid attributes' do
    video = Video.new(valid_attributes)
    expect(video).to be_valid
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

  it 'belongs to a user' do
    video = Video.new(valid_attributes)
    expect(video.user).to eq(user)
  end
end
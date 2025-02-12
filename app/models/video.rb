class Video < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :youtube_video_hash, presence: true
end
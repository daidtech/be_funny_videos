class Video < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 500 }
  validates :youtube_video_hash, presence: true, uniqueness: true
end
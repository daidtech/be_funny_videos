FactoryBot.define do
  factory :video do
    association :user
    title { Faker::Movie.title }
    description { Faker::Lorem.sentence(word_count: 20) }
    youtube_video_hash { SecureRandom.hex(10) }
  end
end
class VideoSerializer
  def initialize(video)
    @video = video
  end

  def to_json
    {
      id: @video.id,
      title: @video.title,
      youtube_video_hash: @video.youtube_video_hash,
      shared_by: @video&.user&.email,
      description: @video.description,
      created_at: @video.created_at,
      updated_at: @video.updated_at
    }
  end
end
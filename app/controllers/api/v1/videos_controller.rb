class Api::V1::VideosController < Api::V1::BaseController
  before_action :set_video, only: [:destroy]

  # GET /api/v1/videos
  def index
    # TODO: Implement pagination
    @videos = Video.all
    render json: @videos.map{ |video| VideoSerializer.new(video).to_json }
  end

  # POST /api/v1/videos
  def create
    @video = Video.new(video_params)
    @video.user = current_user
    if @video.save
      render json: @video, status: :created
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/videos/:id
  def destroy
    @video.destroy
    head :no_content
  end

  private

  def set_video
    @video = Video.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Video not found' }, status: :not_found
  end

  def video_params
    params.require(:video).permit(:title, :description, :youtube_video_hash)
  end
end
class SendNotificationJob < ApplicationJob
  queue_as :default

  def perform(user_id, video_title, sender_name)
    # Broadcast the notification to all users
    ActionCable.server.broadcast( "notifications_channel",
      {title: video_title, sender: sender_name })
  end
end
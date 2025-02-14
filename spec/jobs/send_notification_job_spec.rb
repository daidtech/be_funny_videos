require 'rails_helper'

RSpec.describe SendNotificationJob, type: :job do
  let(:user_id) { 1 }
  let(:video_title) { "New Video" }
  let(:sender_name) { "Admin" }

  it "broadcasts the notification to the notifications_channel" do
    expect(ActionCable.server).to receive(:broadcast).with(
      "notifications_channel",
      { title: video_title, sender: sender_name }
    )

    described_class.perform_now(user_id, video_title, sender_name)
  end
end
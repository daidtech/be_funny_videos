require 'rails_helper'

RSpec.describe NotificationsChannel, type: :channel do
  before do
    stub_connection user_id: 1
  end

  it "subscribes to a stream when channel is subscribed" do
    subscribe
    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from("notifications_channel")
  end

  it "unsubscribes from the stream when channel is unsubscribed" do
    subscribe
    expect(subscription).to be_confirmed
    expect(subscription).to have_stream_from("notifications_channel")

    subscription.unsubscribe_from_channel
    expect(subscription).not_to have_streams
  end
end
require 'spec_helper'

describe Youku::V2::Comments do

  let(:client) { Youku::Client.new(client_id: 'client-id') }

  describe '#by_video' do
    let(:url)   { 'https://openapi.youku.com/v2/comments/by_video.json' }
    let(:query) { {
      client_id: client.client_id,
      video_id:  123,
      page:      1,
      count:     20
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { client.comments.by_video(video_id: 123) }

    it_should_behave_like 'a base Youku API V2 requests'
  end
end

require 'spec_helper'

describe Youku::V2::Videos do

  let(:client) { Youku::Client.new(client_id: 'client-id') }
  let(:videos) { Youku::V2::Videos.new(client) }

  describe '#show_batch' do
    let(:url)   { 'https://openapi.youku.com/v2/videos/show_batch.json' }
    let(:query) { {
      client_id: client.client_id,
      video_ids: 123,
      ext:       '',
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { videos.show_batch(video_ids: 123) }

    it_should_behave_like 'a base Youku API V2 requests'
  end

  describe '#show' do
    let(:url)   { 'https://openapi.youku.com/v2/videos/show.json' }
    let(:query) { {
      client_id: client.client_id,
      video_id: 123,
      ext:      '',
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { videos.show(123) }

    it_should_behave_like 'a base Youku API V2 requests'
  end

  describe '#by_user' do
    let(:url)   { 'https://openapi.youku.com/v2/videos/by_user.json' }
    let(:query) { {
      client_id: client.client_id,
      user_id:   123,
      user_name: '',
      orderby:   'published',
      page:      1,
      count:     20
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { videos.by_user(user_id: 123) }

    it_should_behave_like 'a base Youku API V2 requests'
  end

end

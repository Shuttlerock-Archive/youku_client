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

  describe '#show' do
    let(:url)   { 'https://openapi.youku.com/v2/comments/show.json' }
    let(:query) { {
      client_id:  client.client_id,
      comment_id: 123,
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { client.comments.show(comment_id: 123) }

    it_should_behave_like 'a base Youku API V2 requests'
  end

  describe '#show_batch' do
    let(:url)   { 'https://openapi.youku.com/v2/comments/show_batch.json' }
    let(:query) { {
      client_id:   client.client_id,
      comment_ids: 123,
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { client.comments.show_batch(comment_ids: 123) }

    it_should_behave_like 'a base Youku API V2 requests'
  end

  describe '#hot' do
    subject { client.comments.hot }

    it { expect(subject).to be_a Youku::V2::Comments::Hot }
    it { expect(subject.client).to eq client }
  end

  describe '::Hot' do
    describe '#by_video' do
      let(:url) { 'https://openapi.youku.com/v2/comments/hot/by_video.json' }
      let(:query) { {
        client_id: client.client_id,
        video_id:  123,
        page:      1,
        count:     20
      } }

      before do
        stub_request(:get, url).with(query: query).to_return(status: 200)
      end

      subject { client.comments.hot.by_video(video_id: 123) }

      it_should_behave_like 'a base Youku API V2 requests'
    end
  end
end

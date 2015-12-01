require 'spec_helper'

describe Youku::V2::Videos do

  let(:client) { Youku::Client.new(client_id: 'client-id') }

  describe '#show_basic' do
    let(:url)   { 'https://openapi.youku.com/v2/videos/show_basic.json' }
    let(:query) { {
      client_id: client.client_id,
      video_id:  123,
      video_url: '',
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { client.videos.show_basic(video_id: 123) }

    it_should_behave_like 'a base Youku API V2 requests'
  end

  describe '#show_basic_batch' do
    let(:url)   { 'https://openapi.youku.com/v2/videos/show_basic_batch.json' }
    let(:query) { {
      client_id: client.client_id,
      video_ids:  123,
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { client.videos.show_basic_batch(video_ids: 123) }

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

    subject { client.videos.show(video_id: 123) }

    it_should_behave_like 'a base Youku API V2 requests'
  end

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

    subject { client.videos.show_batch(video_ids: 123) }

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
      count:     20,
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { client.videos.by_user(user_id: 123) }

    it_should_behave_like 'a base Youku API V2 requests'
  end

  describe '#by_related' do
    let(:url)   { 'https://openapi.youku.com/v2/videos/by_related.json' }
    let(:query) { {
      client_id: client.client_id,
      video_id:  123,
      count:     20,
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { client.videos.by_related(video_id: 123) }

    it_should_behave_like 'a base Youku API V2 requests'
  end

  describe '#by_category' do
    let(:url)   { 'https://openapi.youku.com/v2/videos/by_category.json' }
    let(:query) { {
      client_id: client.client_id,
      category:  123,
      genre:     456,
      period:    789,
      orderby:   'view-count',
      page:      1,
      count:     20
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { client.videos.by_category(category: 123, genre: 456, period: 789) }

    it_should_behave_like 'a base Youku API V2 requests'
  end

  describe '#favorite' do
    subject { client.videos.favorite }

    it { expect(subject).to be_a Youku::V2::Videos::Favorite }
    it { expect(subject.client).to eq client }
  end

  describe '::Favorite' do
    describe '#by_user' do
      let(:url) { 'https://openapi.youku.com/v2/videos/favorite/by_user.json' }
      let(:query) { {
        client_id: client.client_id,
        user_id:   123,
        user_name: '',
        orderby:   'favorite-time',
        page:      1,
        count:     20
      } }

      before do
        stub_request(:get, url).with(query: query).to_return(status: 200)
      end

      subject { client.videos.favorite.by_user(user_id: 123) }

      it_should_behave_like 'a base Youku API V2 requests'
    end
  end
end

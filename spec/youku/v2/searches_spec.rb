require 'spec_helper'

describe Youku::V2::Searches do

  let(:client)   { Youku::Client.new(client_id: 'client-id') }
  let(:searches) { Youku::V2::Searches.new(client) }

  describe '#video' do
    subject { searches.video }

    it { expect(subject).to be_a Youku::V2::Searches::Video }
    it { expect(subject.client).to eq client }
  end

  describe '::Video' do
    let(:video) { Youku::V2::Searches::Video.new(client) }

    describe '#by_keyword' do
      let(:url) { 'https://openapi.youku.com/v2/searches/video/by_keyword.json' }
      let(:query) { {
        client_id: client.client_id,
        keyword:   2014,
        period:    'week',
        orderby:   'published',
        page:      1,
        count:     20
      } }

      before do
        stub_request(:get, url).with(query: query).to_return(status: 200)
      end

      subject { video.by_keyword(2014) }

      it_should_behave_like 'a base Youku API V2 requests'
    end
  end

end

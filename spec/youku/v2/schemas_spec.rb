require 'spec_helper'

describe Youku::V2::Schemas do

  let(:client) { Youku::Client.new(client_id: 'client-id') }

  describe '#video' do
    subject { client.schemas.video }

    it { expect(subject).to be_a Youku::V2::Schemas::Video }
    it { expect(subject.client).to eq client }
  end

  describe '::Video' do
    describe '#category' do
      let(:url) { 'https://openapi.youku.com/v2/schemas/video/category.json' }
      let(:query) { {} }

      before do
        stub_request(:get, url).with(query: query).to_return(status: 200)
      end

      subject { client.schemas.video.category }

      it_should_behave_like 'a base Youku API V2 requests'
    end
  end
end

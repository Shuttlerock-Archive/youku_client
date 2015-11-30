require 'spec_helper'

describe Youku::V2::Users do

  let(:client) { Youku::Client.new(client_id: 'client-id') }

  describe '#show_batch' do
    let(:url)   { 'https://openapi.youku.com/v2/users/show_batch.json' }
    let(:query) { {
      client_id:  client.client_id,
      user_ids:   '',
      user_names: 'jackie_chan',
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { client.users.show_batch(user_names: 'jackie_chan') }

    it_should_behave_like 'a base Youku API V2 requests'
  end

  describe '#show' do
    let(:url)   { 'https://openapi.youku.com/v2/users/show.json' }
    let(:query) { {
      client_id: client.client_id,
      user_id:   '',
      user_name: 'jackie_chan',
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { client.users.show(user_name: 'jackie_chan') }

    it_should_behave_like 'a base Youku API V2 requests'
  end

  describe '#friendship' do
    subject { client.users.friendship }

    it { expect(subject).to be_a Youku::V2::Users::Friendship }
    it { expect(subject.client).to eq client }
  end

  describe '::Friendship' do
    describe '#followings' do
      let(:url)   { 'https://openapi.youku.com/v2/users/friendship/followings.json' }
      let(:query) { {
        client_id: client.client_id,
        user_id:   '',
        user_name: 'jackie_chan',
        page:      1,
        count:     20,
      } }

      before do
        stub_request(:get, url).with(query: query).to_return(status: 200)
      end

      subject { client.users.friendship.followings(user_name: 'jackie_chan') }

      it_should_behave_like 'a base Youku API V2 requests'
    end

    describe '#followers' do
      let(:url)   { 'https://openapi.youku.com/v2/users/friendship/followers.json' }
      let(:query) { {
        client_id: client.client_id,
        user_id:   '',
        user_name: 'jackie_chan',
        page:      1,
        count:     20,
      } }

      before do
        stub_request(:get, url).with(query: query).to_return(status: 200)
      end

      subject { client.users.friendship.followers(user_name: 'jackie_chan') }

      it_should_behave_like 'a base Youku API V2 requests'
    end
  end
end

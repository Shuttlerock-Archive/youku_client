require 'spec_helper'

describe Youku::V2::Users do

  let(:client) { Youku::Client.new(client_id: 'client-id') }
  let(:users)  { Youku::V2::Users.new(client) }

  describe '#show_batch' do
    let(:url)   { 'https://openapi.youku.com/v2/users/show_batch.json' }
    let(:query) { {
      client_id: client.client_id,
      user_ids:  nil,
      user_names: 'jackie_chan',
    } }

    before do
      stub_request(:get, url).with(query: query).to_return(status: 200)
    end

    subject { users.show_batch(user_names: 'jackie_chan') }

    it_should_behave_like 'a base Youku API V2 requests'
  end

end

require 'spec_helper'

describe Youku::Client do

  let(:client) { Youku::Client.new }

  describe '#searches' do
    subject { client.searches }

    it { expect(subject).to be_a Youku::V2::Searches }
    it { expect(subject.client).to eq client }
  end

  describe '#videos' do
    subject { client.videos }

    it { expect(subject).to be_a Youku::V2::Videos }
    it { expect(subject.client).to eq client }
  end

  describe '#users' do
    subject { client.users }

    it { expect(subject).to be_a Youku::V2::Users }
    it { expect(subject.client).to eq client }
  end
end

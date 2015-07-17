shared_examples 'a base Youku API V2 requests' do

  it { expect(subject).to be_a Youku::V2::Request }
  it { expect(subject.ok?).to be_truthy }

  context '400 response code on request' do
    before do
      stub_request(:get, url).with(query: query).to_return(status: 404)
    end

    it { expect { subject }.to_not raise_error }
    it { expect(subject.ok?).to be_falsy }
  end
end

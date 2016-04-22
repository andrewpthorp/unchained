require_relative '../../test_helper'

describe Unchained::Client::Servers do

  before do
    @client = Unchained::Client.new
  end

  describe '.servers' do
    it 'should fetch from the API' do
      VCR.use_cassette('servers') do
        servers = @client.servers
        assert_equal(4, servers.count)
      end
    end
  end

end



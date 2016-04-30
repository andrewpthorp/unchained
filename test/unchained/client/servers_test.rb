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

        server = servers.find{|s| s.name == 'WyrmlingPrep'}
        assert(
          server,
          "Expected to find a server with a `name` of 'WyrmlingPrep'.",
        )

        assert_equal(6, server.access_level)
        assert_equal(4, server.channel_id)
        assert_equal('wyrmlingprep.camelotunchained.com', server.host)
        assert_equal('WyrmlingPrep', server.name)
        assert_equal(1000, server.player_maximum)
        assert_equal(1, server.shard_id)
      end
    end
  end

end



require_relative '../../test_helper'

describe Unchained::Client::MOTD do

  before do
    @client = Unchained::Client.new
  end

  describe '.motd' do
    it 'should fetch from the API' do
      VCR.use_cassette('motd') do
        motd = @client.motd

        assert_equal('56ff1eeda7b0a02aa0e464cb', motd.id)
        assert_equal('Welcome to Camelot Unchained!', motd.message)
        assert_equal(30, motd.duration)
      end
    end
  end

end



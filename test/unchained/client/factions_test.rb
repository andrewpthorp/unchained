require_relative '../../test_helper'

describe Unchained::Client::Factions do

  before do
    @client = Unchained::Client.new
  end

  describe '.factions' do
    it 'should fetch from the API' do
      VCR.use_cassette('factions') do
        factions = @client.factions
        assert_equal(4, factions.count)
      end
    end
  end

end



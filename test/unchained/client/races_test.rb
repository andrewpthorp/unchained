require_relative '../../test_helper'

describe Unchained::Client::Races do

  before do
    @client = Unchained::Client.new
  end

  describe '.races' do
    it 'should fetch from the API' do
      VCR.use_cassette('races') do
        races = @client.races
        assert_equal(6, races.count)
      end
    end
  end

end



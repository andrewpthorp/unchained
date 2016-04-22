require_relative '../../test_helper'

describe Unchained::Client::Patcher do

  before do
    @client = Unchained::Client.new
  end

  describe '.patcher_hero_contents' do
    it 'should fetch from the API' do
      VCR.use_cassette('patcher_hero_contents') do
        contents = @client.patcher_hero_contents
        assert_equal(4, contents.count)
      end
    end
  end

  describe '.patcher_alerts' do
    it 'should fetch from the API' do
      VCR.use_cassette('patcher_alerts') do
        alerts = @client.patcher_alerts
        assert_equal(1, alerts.count)
      end
    end
  end

end



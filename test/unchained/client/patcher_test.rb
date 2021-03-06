require_relative '../../test_helper'

describe Unchained::Client::Patcher do

  before do
    @client = Unchained::Client.new
  end

  describe '.patcher_hero_contents' do
    it 'should fetch from the API' do
      VCR.use_cassette('patcher_hero_contents', re_record_interval: nil) do
        contents = @client.patcher_hero_contents
        assert_equal(4, contents.count)

        content = contents.find{|h| h.id == '56e8299ba7b0a06214e5602e'}
        assert(
          content,
          "Expected to find a hero content with an `id` of '56e8299ba7b0a06214e5602e'.",
        )

        assert(
          content.is_a?(Unchained::Client::Patcher::HeroContent),
          'Expected `contents` to return HeroContents.',
        )

        assert_equal('56e8299ba7b0a06214e5602e', content.id)
        assert_match(/videos\/archer.jpg/, content.content)
        assert_equal(7, content.priority)
      end
    end
  end

  describe '.patcher_alerts' do
    it 'should fetch from the API' do
      VCR.use_cassette('patcher_alerts') do
        alerts = @client.patcher_alerts
        assert_equal(1, alerts.count)

        alert = alerts.find{|a| a.id == '56a98f8965fe574304e0a193'}
        assert(
          alert,
          "Expected to find an alert with an `id` of '56a98f8965fe574304e0a193'.",
        )

        assert(
          alert.is_a?(Unchained::Client::Patcher::Alert),
          'Expected `alerts` to return Alerts.',
        )

        assert_equal('56a98f8965fe574304e0a193', alert.id)
        assert_equal('A test message, please ignore', alert.message)
      end
    end
  end

end



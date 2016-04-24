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

        faction = factions.first
        assert(
          faction.is_a?(Unchained::Client::Factions::Faction),
          'Expected `factions` to return Factions.',
        )

        assert_equal(0, faction.id)
        assert_match(/NPC Only/, faction.description)
        assert_equal('Factionless', faction.name)
        assert_equal('Factionless', faction.short_name)
      end
    end
  end

  describe '.faction' do
    it 'should fetch from the API' do
      VCR.use_cassette('faction') do
        faction = @client.faction(1)
        assert(
          faction.is_a?(Unchained::Client::Factions::Faction),
          'Expected `factions` to return Factions.',
        )

        assert_equal(1, faction.id)
        assert_equal('The Tuatha Dé Danann', faction.description)
        assert_equal('Tuatha Dé Danann', faction.name)
        assert_equal('TDD', faction.short_name)
      end
    end
  end

end



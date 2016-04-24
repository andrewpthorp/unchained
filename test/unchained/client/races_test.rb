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

        race = races.first
        assert(
          race.is_a?(Unchained::Client::Races::Race),
          'Expected `races` to return Races,',
        )

        assert_equal('Luchorpan', race.description)
        assert_equal(2, race.id)
        assert_equal('Luchorpan', race.name)

        assert(
          race.faction.is_a?(Unchained::Client::Factions::Faction),
          'Expected `faction` to be expanded on a Race.',
        )
      end
    end
  end

  describe '.race' do
    it 'should fetch from the API' do
      VCR.use_cassette('races') do
        race = @client.race(2)
        assert(
          race.is_a?(Unchained::Client::Races::Race),
          'Expected `races` to return Races,',
        )

        assert_equal('Luchorpan', race.description)
        assert_equal(2, race.id)
        assert_equal('Luchorpan', race.name)

        assert(
          race.faction.is_a?(Unchained::Client::Factions::Faction),
          'Expected `faction` to be expanded on a Race.',
        )
      end
    end
  end

end



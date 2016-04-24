require_relative '../../test_helper'

describe Unchained::Client::Archetypes do

  before do
    @client = Unchained::Client.new
  end

  describe '.archetypes' do
    it 'should fetch from the API' do
      VCR.use_cassette('archetypes') do
        archetypes = @client.archetypes
        assert_equal(9, archetypes.count, "Expected 9 archetypes")

        archetype = archetypes.first

        assert(
          archetype.is_a?(Unchained::Client::Archetypes::Archetype),
          'Expected `archetypes` to return Archetypes.',
        )

        assert_equal('The Dark Knight', archetype.description)
        assert_equal(7, archetype.id)
        assert_equal('Black Knight', archetype.name)

        # check that it expands the faction
        assert(
          archetype.faction.is_a?(Unchained::Client::Factions::Faction),
          'Expected `faction` to be expanded.',
        )
      end
    end
  end

  describe '.archetype' do
    it 'should fetch from the API' do
      VCR.use_cassette('archetypes') do
        archetype = @client.archetype(7)

        assert(
          archetype.is_a?(Unchained::Client::Archetypes::Archetype),
          'Expected `archetype` to return an Archetype.',
        )

        assert_equal('The Dark Knight', archetype.description)
        assert_equal(7, archetype.id)
        assert_equal('Black Knight', archetype.name)

        # check that it expands the faction
        assert(
          archetype.faction.is_a?(Unchained::Client::Factions::Faction),
          'Expected `faction` to be expanded.',
        )
      end
    end
  end


end



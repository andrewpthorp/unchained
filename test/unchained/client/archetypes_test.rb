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
        assert_equal('The Dark Knight', archetype.description)
        assert_equal(3, archetype.faction)
        assert_equal(7, archetype.id)
        assert_equal('Black Knight', archetype.name)
      end
    end
  end


end



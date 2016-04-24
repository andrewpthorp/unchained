require_relative '../../test_helper'

describe Unchained::Client::Attributes do

  before do
    @client = Unchained::Client.new
  end

  describe '.attributes' do
    it 'should fetch from the API' do
      VCR.use_cassette('attributes') do
        attributes = @client.attributes(1)
        assert_equal(37, attributes.count)

        attribute = attributes.first
        assert(
          attribute.is_a?(Unchained::Client::Attributes::AttributeInfo),
          'Expected `attributes(i)` to return AttributeInfos.',
        )

        assert_equal(30.0, attribute.base_value)
        assert_equal('None', attribute.derived_from)
        assert_match(/power of the character's magic effects/, attribute.description)
        assert_equal(100.0, attribute.max_or_multiplier)
        assert_equal('Attunement', attribute.name)
        assert_equal(1, attribute.type)
        assert_equal('units', attribute.units)
      end
    end
  end

  describe '.attribute_offsets' do
    it 'should fetch from the API' do
      VCR.use_cassette('attribute_offsets') do
        offsets = @client.attribute_offsets(1)
        assert_equal(12, offsets.count)

        offset = offsets.first
        assert(
          offset.is_a?(Unchained::Client::Attributes::AttributeOffset),
          'Expected `attribute_offsets` to return AttributeOffsets.',
        )

        assert(
          offset.race.is_a?(Unchained::Client::Races::Race),
          'Expected `race` to be a Race.',
        )

        assert_equal(1, offset.gender)

        # Assert a few of the hash elements.
        assert(
          offset.offsets.is_a?(Hash),
          'Expected `offsets` to be a Hash.',
        )
        assert_equal(1.0, offset.offsets['Strength'])
        assert_equal(-4.0, offset.offsets['Attunement'])
        assert_equal(5.0, offset.offsets['Presence'])
      end
    end
  end

end



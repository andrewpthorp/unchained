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
      end
    end
  end

  describe '.attribute_offsets' do
    it 'should fetch from the API' do
      VCR.use_cassette('attribute_offsets') do
        offsets = @client.attribute_offsets(1)
        assert_equal(12, offsets.count)
      end
    end
  end

end



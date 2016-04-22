require_relative '../test_helper'

describe Unchained::Client do

  before do
    @client = Unchained::Client.new
  end

  it 'should initialize the cache' do
    refute_nil(@client.cache)
    assert(@client.cache.is_a?(Hash))
  end

  describe '#clear_cache!' do
    it 'clears the cache' do
      cache = {foo: 'bar'}
      @client.instance_variable_set("@cache", cache)
      assert_equal(cache, @client.cache)

      @client.clear_cache!
      assert_empty(@client.cache)
    end
  end

end

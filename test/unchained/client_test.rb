require_relative '../test_helper'

describe Unchained::Client do

  before do
    @client = Unchained::Client.new
  end

  Unchained::Configuration::KEYS.each do |k|
    it "should set up an accessor for #{k}" do
      assert(
        @client.respond_to?(k),
        "Expected `@client` to respond to `#{k}`.",
      )

      assert(
        @client.respond_to?("#{k}="),
        "Expected `@client` to respond to `#{k}=`.",
      )
    end
  end

  describe 'initialization' do
    it 'should initialize the cache' do
      refute_nil(@client.cache)
      assert(@client.cache.is_a?(Hash))
    end

    it 'should initialize from the configuration' do
      Unchained.configure {|c| c.login_token = 'init_token'}
      client = Unchained::Client.new
      assert_equal('init_token', client.login_token)
      Unchained.reset!
      client = Unchained::Client.new
      assert_nil(client.login_token)
    end
  end

  describe '#base_url' do
    it 'should be set correctly' do
      assert_equal(
        'http://api.camelotunchained.com/v1',
        @client.base_url,
      )
    end
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

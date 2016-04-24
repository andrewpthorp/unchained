require_relative '../test_helper'

describe Unchained::Configuration do

  class SampleClass
    extend Unchained::Configuration
  end

  after do
    SampleClass.reset!
  end

  describe 'accessors' do
    Unchained::Configuration::KEYS.each do |k|
      it "should create an accessor for #{k}" do
        assert(
          SampleClass.respond_to?(k),
          "Expected `SampleClass` to respond to `#{k}`.",
        )

        assert(
          SampleClass.respond_to?("#{k}="),
          "Expected `SampleClass` to respond to `#{k}=`.",
        )
      end
    end
    it 'should create an accessor for every KEY' do
    end
  end

  describe '.configure' do
    it 'should allow you to configure SampleClass' do
      SampleClass.configure {|c| c.login_token = 'abc123'}
      assert_equal('abc123', SampleClass.login_token)
    end
  end

  describe '.configuration' do
    it 'should return the configuration' do
      assert_equal({login_token: nil}, SampleClass.configuration)
      SampleClass.login_token = 'abc123'
      assert_equal({login_token: 'abc123'}, SampleClass.configuration)
    end
  end

  describe '.reset!' do
    it 'should reset the configuration' do
      SampleClass.login_token = 'abc1234'
      assert_equal('abc1234', SampleClass.login_token)
      SampleClass.reset!
      assert_nil(SampleClass.login_token)
    end
  end
end

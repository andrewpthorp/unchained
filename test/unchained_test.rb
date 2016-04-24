require_relative './test_helper'

describe Unchained do

  it 'should extend Configuration' do
    assert(
      (class << Unchained; self end)
        .included_modules
        .include?(Unchained::Configuration),
      'Expected `Unchained` to extend `Unchained::Configuration`.',
    )
  end

  describe '.new' do
    it 'should return a new Unchained::Client' do
      client = Unchained.new
      assert(
        client.is_a?(Unchained::Client),
        'Expected `Unchained.new` to return an `Unchained::Client`.',
      )
    end
  end

end

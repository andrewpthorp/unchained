require_relative '../../../test_helper'

describe 'Resource Mixin' do

  class SampleResource
    include Unchained::Client::Mixins::Resource

    attribute :company, String, allow_nil: true
    attribute :name, String, allow_nil: false
    attribute :city, String
  end

  describe 'nil attributes' do
    it 'should allow nil values' do
      resource = SampleResource.from_json(company: nil)
      assert_nil(resource.company, 'Expected `company` to be nil')
    end

    it 'should parse non-nil values correctly' do
      resource = SampleResource.from_json(company: 'CSE')
      assert_equal('CSE', resource.company, 'Expected `company` to be set.')
    end

    it 'should allow you to disable nil explicitly' do
      assert_raises(Unchained::InvalidValue) do
        SampleResource.from_json(name: nil)
      end
    end

    it 'should default to not allow nil' do
      assert_raises(Unchained::InvalidValue) do
        SampleResource.from_json(city: nil)
      end
    end
  end

end


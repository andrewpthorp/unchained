require_relative '../../../test_helper'

describe 'Resource Mixin' do

  class SampleResource
    include Unchained::Client::Mixins::Resource

    attribute :company, String, allow_nil: true
    attribute :name, String, allow_nil: false
    attribute :city, String, json: 'someField'
    attribute :expanded, String, expand: :foo
  end

  describe 'attributes' do
    it 'should set up instance methods for each attribute' do
      resource = SampleResource.new
      resource.company = 'CSE'
      assert_equal('CSE', resource.company)
    end

    it 'should let you get a list of attributes from the class' do
      attributes = SampleResource.attributes
      assert_equal(4, attributes.count)

      attribute = attributes.find{|a| a.name == :company}
      assert(attribute, 'Expected an attribute with a name of `:company`.')

      assert_equal(:company, attribute.name)
      assert_equal(String, attribute.type)
      assert_equal({allow_nil: true}, attribute.opts)
    end

    it 'should not let you set the attributes on the class' do
      refute(
        SampleResource.respond_to?("attributes="),
        'The Resource should not setup `attributes=`.',
      )
    end
  end

  describe 'nil attributes' do
    it 'should allow nil values' do
      resource = SampleResource.from_hash(company: nil)
      assert_nil(resource.company, 'Expected `company` to be nil')
    end

    it 'should parse non-nil values correctly' do
      resource = SampleResource.from_hash(company: 'CSE')
      assert_equal('CSE', resource.company, 'Expected `company` to be set.')
    end

    it 'should allow you to disable nil explicitly' do
      assert_raises(Unchained::InvalidValue) do
        SampleResource.from_hash(name: nil)
      end
    end

    it 'should default to not allow nil' do
      assert_raises(Unchained::InvalidValue) do
        SampleResource.from_hash(someField: nil)
      end
    end
  end

  describe 'helper methods' do
    before do
      @resource = SampleResource.new
    end

    def find_attribute(name)
      SampleResource.attributes.find{|a| a.name == name}
    end

    describe '#json_field' do
      it 'should default to the name' do
        attribute = find_attribute(:company)
        assert_equal('company', attribute.json_field)
      end

      it 'should allow you to override' do
        attribute = find_attribute(:city)
        assert_equal('someField', attribute.json_field)
      end
    end

    describe '#allow_nil?' do
      it 'should default to false' do
        attribute = find_attribute(:city)
        refute(
          attribute.allow_nil?,
          'Expected `allow_nil?` to default to false.',
        )
      end

      it 'should allow you to override' do
        attribute = find_attribute(:company)
        assert(
          attribute.allow_nil?,
          'Expected `allow_nil?` to be set to true.',
        )
      end
    end

    describe '#expand_method' do
      it 'should default to nil' do
        attribute = find_attribute(:name)
        assert_nil(attribute.expand_method)
      end

      it 'should allow you to override' do
        attribute = find_attribute(:expanded)
        assert_equal(:foo, attribute.expand_method)
      end
    end

  end
end


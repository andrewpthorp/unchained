module Unchained
  class Client
    module Attributes

      class AttributeInfo
        include Unchained::Client::Mixins::Resource

        attribute :base_value, Float, json: 'baseValue'
        attribute :derived_from, String, json: 'derivedFrom'
        attribute :description, String
        attribute :max_or_multipler, Float, json: 'maxOrMultipler'
        attribute :name, String
        attribute :type, Integer
        attribute :units, String
      end

      class AttributeOffset
        include Unchained::Client::Mixins::Resource

        attribute :race, Integer, expand: :race
        attribute :gender, Integer
        attribute :offsets, Hash, json: 'attributeOffsets'
      end

      def attributes(shard, opts={})
        @cache[:attributes] ||= get_resources(
          "#{base_url}/gamedata/attributes/#{shard}",
          AttributeInfo,
          opts,
        )
      end

      def attribute_offsets(shard, opts={})
        @cache[:attribute_offsets] ||= get_resources(
          "#{base_url}/gamedata/attributeoffsets/#{shard}",
          AttributeOffset,
          opts,
        )
      end

    end
  end
end

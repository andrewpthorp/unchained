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

      def attributes(shard, opts={})
        get_resources("#{base_url}/gamedata/attributes/#{shard}", AttributeInfo, opts)
      end

    end
  end
end

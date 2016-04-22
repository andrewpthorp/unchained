module Unchained
  class Client
    module Archetypes

      class Archetype
        include Unchained::Client::Mixins::Resource

        attribute :description, String
        attribute :faction, Integer
        attribute :id, Integer
        attribute :name, String
      end

      def archetypes(opts={})
        get_resources("#{base_url}/gamedata/archetypes", Archetype, opts)
      end

    end
  end
end

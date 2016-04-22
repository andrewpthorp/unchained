module Unchained
  class Client
    module Archetypes

      class Archetype
        include Unchained::Client::Mixins::Resource
        resource({
          :description => 'description',
          :faction => 'faction',
          :id => 'id',
          :name => 'name',
        })
      end

      def archetypes(opts={})
        get_resources("#{base_url}/gamedata/archetypes", Archetype, opts)
      end

    end
  end
end

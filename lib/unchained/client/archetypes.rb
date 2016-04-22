module Unchained
  class Client
    module Archetypes

      class Archetype
        include Unchained::Client::Resource
        resource({
          :description => 'description',
          :faction => 'faction',
          :id => 'id',
          :name => 'name',
        })
      end

      def archetypes(opts={})
        get("#{base_url}/gamedata/archetypes", opts).map do |server|
          Archetype.decode_result(server)
        end
      end

    end
  end
end

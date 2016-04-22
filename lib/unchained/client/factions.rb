module Unchained
  class Client
    module Factions

      class Faction
        include Unchained::Client::Mixins::Resource

        attribute :description, String
        attribute :id, Integer
        attribute :name, String
        attribute :short_name, String, json: 'shortName'
      end

      def factions(opts={})
        get_resources("#{base_url}/gamedata/factions", Faction, opts)
      end

      def faction(id, opts={})
        factions(opts).find {|f| f.id == id}
      end

    end
  end
end

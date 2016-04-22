module Unchained
  class Client
    module Factions

      class Faction
        include Unchained::Client::Mixins::Resource
        resource({
          :description => 'description',
          :id => 'id',
          :name => 'name',
          :short_name => 'shortName',
        })
      end

      def factions(opts={})
        get_resources("#{base_url}/gamedata/factions", Faction, opts)
      end

    end
  end
end

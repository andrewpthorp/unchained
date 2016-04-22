module Unchained
  class Client
    module Races

      class Race
        include Unchained::Client::Mixins::Resource

        attribute :description, String
        attribute :faction, Integer
        attribute :id, Integer
        attribute :name, String
      end

      def races(opts={})
        get_resources("#{base_url}/gamedata/races", Race, opts)
      end

    end
  end
end

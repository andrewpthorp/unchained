module Unchained
  class Client
    module Races

      class Race
        include Unchained::Client::Mixins::Resource

        attribute :description, String
        attribute :faction, Integer, expand: :faction
        attribute :id, Integer
        attribute :name, String
      end

      def races(opts={})
        get_resources("#{base_url}/gamedata/races", Race, opts)
      end

      def race(id, opts={})
        races(opts).find {|r| r.id == id}
      end

    end
  end
end

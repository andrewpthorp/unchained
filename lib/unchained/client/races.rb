module Unchained
  class Client
    module Races

      class Race
        include Unchained::Client::Mixins::Resource
        resource({
          :description => 'description',
          :faction => 'faction',
          :id => 'id',
          :name => 'name',
        })
      end

      def races(opts={})
        get_resources("#{base_url}/gamedata/races", Race, opts)
      end

    end
  end
end
